import 'dart:async';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:dart_nats_streaming/src/protocol.dart';

class Subscription {
  final nats.Subscription subscription;
  final List<StreamSubscription> _listeners = [];
  final String subject;
  final String ackInbox;

  Stream<DataMessage>? _stream;
  Stream<DataMessage> get stream => _stream ??= subscription.stream!.transform(_protoTransformer).asBroadcastStream();

  Subscription({required this.subscription, required this.subject, required this.ackInbox});

  StreamSubscription<DataMessage> listen(void Function(DataMessage dataMessage) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    var listener = stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _listeners.add(listener);

    return listener;
  }

  final StreamTransformer<nats.Message, DataMessage> _protoTransformer = StreamTransformer.fromHandlers(
    handleData: (nats.Message message, EventSink<DataMessage> sink) {
      var messageProto = MsgProto.fromBuffer(message.data);
      var stanMessage = DataMessage.fromProto(messageProto);
      // print('Subject: [${stanMessage.subject}] Sequence: [${stanMessage.sequence}] isRedelivery: [${stanMessage.isRedelivery}]');

      sink.add(stanMessage);
    },
  );
}
