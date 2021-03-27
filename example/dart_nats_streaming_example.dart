import 'package:dart_nats_streaming/dart_nats_streaming.dart';

void main() async {
  final stan = Client();
  await stan.connect(host: 'localhost');
  print('connected: ${stan.connected}');
}
