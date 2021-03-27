import 'package:dart_nats/dart_nats.dart' as nats;

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

  nats.Client _natsClient;
}
