import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:fixnum/fixnum.dart';

class DataMessage {
  final MsgProto _proto;
  final Uint8List encodedPayload;

  DataMessage.fromProto(this._proto) : encodedPayload = _proto.data as Uint8List;

  String get subject => _proto.subject;
  Int64 get sequence => _proto.sequence;
  Int64 get timestamp => _proto.timestamp;
  bool get isRedelivery => _proto.redelivered;

  @override
  String toString() {
    Encoding encoding = utf8;
    return encoding.decode(encodedPayload);
  }
}
