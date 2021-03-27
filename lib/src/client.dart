import 'package:dart_nats/dart_nats.dart' as nats;
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
  bool _connected = false;

  // ####################################################
  //                      Getters
  // ####################################################

  bool get connected => _connected;

  // ####################################################
  //                      Methods
  // ####################################################

  Future<bool> connect({
    required String host,
    String? clientID,
    int port = 4222,
    nats.ConnectOption? connectOption,
    int timeout = 5,
    bool retry = true,
    int retryInterval = 10,
  }) async {
    Uuid uuid = Uuid();
    clientID ??= uuid.v4();
    await _natsClient.connect(
      host,
      port: port,
      connectOption: connectOption,
      timeout: timeout,
      retry: retry,
      retryInterval: retryInterval,
    );
    _connected = _natsClient.status == nats.Status.connected;
    return _connected;
  }

  void close() {
    _connected = false;
    _natsClient.close();
  }
}
