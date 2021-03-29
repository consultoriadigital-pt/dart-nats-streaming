import 'dart:async';

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

  var counter = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    counter++;
    print('Publishing: this is an event (#$counter) on topic: test');
    stan.pubString(subject: 'test', string: 'this is an event (#$counter}) on topic: test');
  });
}
