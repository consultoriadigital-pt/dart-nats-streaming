import 'package:dart_nats_streaming/dart_nats_streaming.dart';

void main() async {
  final stan = Client();

  stan.onConnect(function: () {
    print('Stan connected..');
  });

  stan.onDisconnect(function: () {
    print('Stan disconnected..');
  });

  await stan.connect(host: 'localhost');
}
