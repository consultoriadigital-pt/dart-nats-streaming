import 'dart:convert';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/DataMessage.dart';
import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:fixnum/fixnum.dart';
import 'package:pedantic/pedantic.dart';
import 'package:uuid/uuid.dart';

class Client {
  // ####################################################
  //                      Factories
  // ####################################################

  static final Client _client = Client._constructor();

  factory Client() {
    return _client;
  }

  Client._constructor();

  // ####################################################
  //                      Attributes
  // ####################################################

  final nats.Client _natsClient = nats.Client();
  final String connectionID = Uuid().v4();
  String _clientID = Uuid().v4();
  bool _connected = false;
  ConnectResponse? _connectResponse;
  Function? _onConnect;
  Function? _onDisconnect;
  nats.Subscription? _inboxSub;

  // ####################################################
  //                Configuration Attributes
  // ####################################################

  String host = '';
  int port = 4222;
  bool retryReconnect = true;
  int retryInterval = 10;
  int pingMaxAttempts = 3;
  int failPings = 0;
  int pingInterval = 5;
  int timeout = 10;
  nats.ConnectOption? connectOption;
  String clusterID = 'default';

  // ####################################################
  //                      Getters
  // ####################################################

  bool get connected => _connected;
  String get clientID => _clientID;
  List<int> get connectionIDAscii => ascii.encode(this.connectionID);

  // ####################################################
  //                      Methods
  // ####################################################

  Future<bool> connect({
    required String host,
    int port = 4222,
    int? timeout,
    nats.ConnectOption? connectOption,
    bool? retryReconnect,
    int? retryInterval,
    String? clientID,
    String? clusterID,
    int? pingInterval,
    int? pingMaxAttempts,
  }) async {
    this.host = host;
    this.port = port;

    if (clientID != null) {
      _clientID = clientID;
    }

    if (retryReconnect != null) {
      this.retryReconnect = retryReconnect;
    }

    if (pingMaxAttempts != null) {
      this.pingMaxAttempts = pingMaxAttempts;
    }

    if (connectOption != null) {
      this.connectOption = connectOption;
    }

    if (retryInterval != null) {
      this.retryInterval = retryInterval;
    }

    if (clusterID != null) {
      this.clusterID = clusterID;
    }

    if (pingInterval != null) {
      this.pingInterval = pingInterval;
    }

    if (timeout != null) {
      this.timeout = timeout;
    }

    return await _connect();
  }

  Future<bool> _connect() async {
    try {
      await _natsClient.connect(
        host,
        port: port,
        connectOption: connectOption,
        timeout: timeout,
        retry: false,
        retryInterval: retryInterval,
      );
    } catch (e) {
      print('Connecting Error: [$e]');
      unawaited(_reconnect());
    }

    if (_natsClient.status == nats.Status.connected) {
      // Generante new clientID for reconnection
      _clientID = Uuid().v4();
      ConnectRequest connectRequest = ConnectRequest()
        ..clientID = this.clientID
        ..heartbeatInbox = this.connectionID
        ..connID = this.connectionIDAscii
        ..protocol = 1
        ..pingInterval = pingInterval
        ..pingMaxOut = this.pingMaxAttempts;

      // Connecting to Streaming Server
      _connectResponse =
          ConnectResponse.fromBuffer((await _natsClient.request('_STAN.discover.$clusterID', connectRequest.writeToBuffer())).data);
      unawaited(pingResponseWatchdog());

      if (_onConnect != null) {
        _onConnect!();
      }
      unawaited(_heartbeat());
      return true;
    }
    return false;
  }

  Future<void> _disconnect() async {
    _natsClient.close();
    if (_onDisconnect != null && _connected) {
      _onDisconnect!();
    }
    _connected = false;
  }

  Future<void> _heartbeat() async {
    if (await ping()) {
      failPings = 0;
      _connected = true;
    } else {
      failPings++;
      print('PING Fail. Attempt: [$failPings/$pingMaxAttempts] '
          'NATS: [${_natsClient.status == nats.Status.connected ? 'connected' : 'disconnected'}]');
    }
    if (failPings >= pingMaxAttempts || _natsClient.status != nats.Status.connected) {
      await _reconnect();
    } else {
      Future.delayed(Duration(seconds: pingInterval), () => _heartbeat());
    }
  }

  Future<void> _reconnect() async {
    await _disconnect();
    if (retryReconnect) {
      await Future.delayed(Duration(seconds: retryInterval), () => {});
      await _connect();
    }
  }

  Future<void> pingResponseWatchdog() async {
    _inboxSub = _natsClient.sub(connectionID);
    await for (nats.Message message in _inboxSub!.stream!) {
      _natsClient.pubString(message.replyTo!, '');
    }
  }

  void onDisconnect({required Function function}) {
    _onDisconnect = function;
  }

  void onConnect({required Function function}) {
    _onConnect = function;
  }

  Future<bool> ping() async {
    Ping ping = Ping()..connID = connectionIDAscii;
    try {
      nats.Message message = await _natsClient.request(_connectResponse!.pingRequests, ping.writeToBuffer());
      return message.string.isEmpty;
    } catch (e) {
      return false;
    }
  }

  void close() {
    _connected = false;
    _natsClient.close();
    _onDisconnect!();
  }

  Future<bool> pubString({required String subject, required String string}) async {
    try {
      final Encoding encoding = ascii;
      PubMsg pubMsg = PubMsg()
        ..clientID = this.clientID
        ..guid = Uuid().v4()
        ..subject = subject
        ..data = encoding.encode(string)
        ..connID = this.connectionIDAscii;
      _natsClient.pub('${this._connectResponse!.pubPrefix}.$subject', pubMsg.writeToBuffer());
      return true;
    } catch (e) {
      print('Publishing Fail: [$e]');
      return false;
    }
  }

  Future<Subscription?> subscribe({
    required String subject,
    int maxInFlight = 2,
    bool manualAck = false,
    int ackWaitSeconds = 3,
    String? queueGroup,
    String? durableName,
    StartPosition? startPosition,
    Int64? startSequence,
    Int64? startTimeDelta,
  }) async {
    try {
      // Listen Inbox before subscribing
      final String inbox = '${subject}_${queueGroup ?? ''}_${Uuid().v4()}';
      final natsSubscription = _natsClient.sub(inbox, queueGroup: queueGroup);

      // Subscribing
      SubscriptionRequest subscriptionRequest = SubscriptionRequest()
        ..clientID = this.clientID
        ..subject = subject
        ..inbox = inbox;

      if (queueGroup != null) subscriptionRequest.qGroup = queueGroup;
      if (maxInFlight != null) subscriptionRequest.maxInFlight = maxInFlight;
      if (ackWaitSeconds != null) subscriptionRequest.ackWaitInSecs = ackWaitSeconds;
      if (durableName != null) subscriptionRequest.durableName = durableName;
      if (startPosition != null) subscriptionRequest.startPosition = startPosition;
      if (startSequence != null) subscriptionRequest.startSequence = startSequence;
      if (startTimeDelta != null) subscriptionRequest.startTimeDelta = startTimeDelta;

      SubscriptionResponse subscriptionResponse = SubscriptionResponse.fromBuffer(
          (await _natsClient.request(_connectResponse!.subRequests, subscriptionRequest.writeToBuffer())).data);
      if (subscriptionResponse.hasError()) {
        throw Exception(subscriptionResponse.error);
      }

      Subscription subscription;
      if (durableName == null) {
      } else {
        subscription = Subscription(subject: subject, subscription: natsSubscription, ackInbox: subscriptionResponse.ackInbox);
        return subscription;
      }
    } catch (e) {
      print('Subscribe Error: [$e]');
    }
  }

  void acknowledge(Subscription subscription, DataMessage dataMessage) {
    Ack ack = Ack()
      ..subject = dataMessage.subject
      ..sequence = dataMessage.sequence;
    _natsClient.pub(subscription.ackInbox, ack.writeToBuffer());
  }
}
