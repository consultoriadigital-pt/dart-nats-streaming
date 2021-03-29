import 'package:dart_nats_streaming/dart_nats_streaming.dart';

void main() async {
  final stan = Client();

  stan.onConnect(function: () {
    print('Stan connected..');
  });

  stan.onDisconnect(function: () {
    print('Stan disconnected..');
  });

  await stan.connect(host: 'localhost', clusterID: 'default');
  await for (final message in (await stan.subscribe(subject: 'test', queueGroup: 'subscriber', durableName: 'fred'))!.stream) {
    print(message.asString());
  }
}
