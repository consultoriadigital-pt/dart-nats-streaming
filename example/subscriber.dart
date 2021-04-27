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
  final subscription = await stan.subscribe(subject: 'test', queueGroup: 'queue-name', durableName: 'durable-name');
  await for (final dataMessage in subscription!.stream) {
    print(dataMessage.toString());
    stan.acknowledge(subscription, dataMessage);
  }
}
