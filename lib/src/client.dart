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
  String _clientID = Uuid().v4();
  bool _connected = false;
  ConnectResponse? _connectResponse;
  Function? _onConnect;
  Function? _onDisconnect;
  final String connectionID = Uuid().v4();
  nats.Subscription? _heartbeat;

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
    nats.ConnectOption? connectOption,
    int timeout = 5,
    bool retry = true,
    int retryInterval = 10,
    String? clientID,
    String clusterID = 'default',
    int pingInterval = 10,
    int maxPingsOutstanding = 3,
  }) async {
    if (clientID != null) {
      _clientID = clientID;
    }

    await _natsClient.connect(
      host,
      port: port,
      connectOption: connectOption,
      timeout: timeout,
      retry: retry,
      retryInterval: retryInterval,
    );

    ConnectRequest connectRequest = ConnectRequest()
      ..clientID = this.clientID
      ..heartbeatInbox = this.connectionID
      ..connID = this.connectionIDAscii
      ..protocol = 1
      ..pingInterval = pingInterval
      ..pingMaxOut = maxPingsOutstanding;

    // Connecting to Streaming Server
    _connectResponse =
        ConnectResponse.fromBuffer((await _natsClient.request('_STAN.discover.$clusterID', connectRequest.writeToBuffer())).data);
    unawaited(pingResponseWatchdog());

    _connected = _natsClient.status == nats.Status.connected;
    _onConnect!();
    return _connected;
  }

  Future<void> pingResponseWatchdog() async {
    _heartbeat = _natsClient.sub(connectionID);
    await for (nats.Message message in _heartbeat!.stream!) {
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
    nats.Message message = await _natsClient.request(_connectResponse!.pingRequests, ping.writeToBuffer());
    return message.string.isEmpty;
  }

  void close() {
    _connected = false;
    _natsClient.close();
    _onDisconnect!();
  }
}
