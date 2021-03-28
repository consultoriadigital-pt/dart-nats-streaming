import 'dart:convert';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/protocol.dart';
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
    await _natsClient.connect(
      host,
      port: port,
      connectOption: connectOption,
      timeout: timeout,
      retry: this.retryReconnect,
      retryInterval: retryInterval,
    );

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
    if (_onDisconnect != null) {
      _onDisconnect!();
    }
    _connected = false;
    await Future.delayed(Duration(seconds: retryInterval), () => {});
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
      await _disconnect();
      if (retryReconnect) {
        await _connect();
      }
    } else {
      Future.delayed(Duration(seconds: pingInterval), () => _heartbeat());
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
}
