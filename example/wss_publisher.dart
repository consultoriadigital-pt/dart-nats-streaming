import 'dart:async';
import 'dart:io';

import 'package:dart_nats/dart_nats.dart' hide Client;
import 'package:dart_nats_streaming/dart_nats_streaming.dart';

void main() async {
  final stan = Client();

  stan.onConnect(function: () {
    print('Stan connected..');
  });

  stan.onDisconnect(function: () {
    print('Stan disconnected..');
  });

  await stan.connectUri(
      Uri.parse("wss://localhost"),
      clusterID: 'test-cluster',
      certificate: File('./example/certificate.pem').readAsBytesSync(),
      connectOption: ConnectOption(tlsRequired: true));

  var counter = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    counter++;
    print('Publishing: this is an event (#$counter) on topic: test');
    stan.pubString(
        subject: 'test',
        string: 'this is an event (#$counter}) on topic: test');
  });
}
