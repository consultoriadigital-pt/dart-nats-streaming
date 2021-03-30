# Dart-NATS-Streaming
A null-safety Dart client for the [NATS](https://nats.io) Streaming messaging system. Design to use with Dart and flutter.

This project is still in pre-release and not all features are yet implemented..

## Publisher Example:

Run the `example/publisher.dart`:

```
dart example/publisher.dart
```

```dart
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

  await stan.connect(host: 'localhost', clusterID: 'my-cluster-id');

  var counter = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    counter++;
    print('Publishing: this is an event (#$counter) on topic: test');
    stan.pubString(subject: 'test', string: 'this is an event (#$counter}) on topic: test');
  });
}

```

## Subscriber Example:

Run the `example/publisher.dart`:

```
dart example/publisher.dart
```

```dart
import 'package:dart_nats_streaming/dart_nats_streaming.dart';

void main() async {
  final stan = Client();

  stan.onConnect(function: () {
    print('Stan connected..');
  });

  stan.onDisconnect(function: () {
    print('Stan disconnected..');
  });

  await stan.connect(host: 'localhost', clusterID: 'my-cluster-id');
  final subscription = await stan.subscribe(subject: 'test', queueGroup: 'my-queue-group', durableName: 'my-dourable-name');
  await for (final dataMessage in subscription!.stream) {
    print(dataMessage.asString());
    stan.acknowledge(subscription, dataMessage);
  }
}

```

## Flutter Examples:

Import and Declare object
```dart
import 'package:dart_nats_streaming/dart_nats_streaming.dart';

  final stan = Client();
  Subscription testSubscription;
```

Simply connect to server and subscribe to subject
```dart
  void connect() async {
    await stan.connect(host: 'localhost', clusterID: 'my-cluster-id');
    testSubscription = await stan.subscribe(subject: 'test', queueGroup: 'my-queue-group', durableName: 'my-dourable-name');
  }
```
Use as Stream in StreamBuilder
```dart
          StreamBuilder(
            stream: testSubscription.stream,
            builder: (context, AsyncSnapshot<DataMessage> snapshot) {
              stan.acknowledge(testSubscription, snapshot.data);
              return Text(snapshot.hasData ? '${snapshot.data.asString()}' : '');
            },
          ),
```

Publish Message
```dart
      stan.pubString(subject: 'subject', string: 'message string');
```

This project is built on top of [dart_nats](https://pub.dev/packages/dart_nats) and was heavily inspired and copied from the [stan_dart](https://pub.dev/packages/stan_dart).

Contributors and PR are welcome.
