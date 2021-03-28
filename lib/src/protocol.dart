import 'package:protobuf/protobuf.dart' as protobuf;

class ConnectRequest extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('ConnectRequest', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'clientID', protoName: 'clientID')
        ..aOS(2, 'heartbeatInbox', protoName: 'heartbeatInbox')
        ..a<int>(3, 'protocol', protobuf.PbFieldType.O3)
        ..a<List<int>>(4, 'connID', protobuf.PbFieldType.OY, protoName: 'connID')
        ..a<int>(5, 'pingInterval', protobuf.PbFieldType.O3, protoName: 'pingInterval')
        ..a<int>(6, 'pingMaxOut', protobuf.PbFieldType.O3, protoName: 'pingMaxOut')
        ..hasRequiredFields = false;

  ConnectRequest._() : super();
  factory ConnectRequest() => create();
  factory ConnectRequest.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static protobuf.PbList<ConnectRequest> createRepeated() => protobuf.PbList<ConnectRequest>();
  @pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @protobuf.TagNumber(1)
  String get clientID => $_getSZ(0);
  @protobuf.TagNumber(1)
  set clientID(String v) {
    $_setString(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasClientID() => $_has(0);
  @protobuf.TagNumber(1)
  void clearClientID() => clearField(1);

  @protobuf.TagNumber(2)
  String get heartbeatInbox => $_getSZ(1);
  @protobuf.TagNumber(2)
  set heartbeatInbox(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasHeartbeatInbox() => $_has(1);
  @protobuf.TagNumber(2)
  void clearHeartbeatInbox() => clearField(2);

  @protobuf.TagNumber(3)
  int get protocol => $_getIZ(2);
  @protobuf.TagNumber(3)
  set protocol(int v) {
    $_setSignedInt32(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasProtocol() => $_has(2);
  @protobuf.TagNumber(3)
  void clearProtocol() => clearField(3);

  @protobuf.TagNumber(4)
  List<int> get connID => $_getN(3);
  @protobuf.TagNumber(4)
  set connID(List<int> v) {
    $_setBytes(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasConnID() => $_has(3);
  @protobuf.TagNumber(4)
  void clearConnID() => clearField(4);

  @protobuf.TagNumber(5)
  int get pingInterval => $_getIZ(4);
  @protobuf.TagNumber(5)
  set pingInterval(int v) {
    $_setSignedInt32(4, v);
  }

  @protobuf.TagNumber(5)
  bool hasPingInterval() => $_has(4);
  @protobuf.TagNumber(5)
  void clearPingInterval() => clearField(5);

  @protobuf.TagNumber(6)
  int get pingMaxOut => $_getIZ(5);
  @protobuf.TagNumber(6)
  set pingMaxOut(int v) {
    $_setSignedInt32(5, v);
  }

  @protobuf.TagNumber(6)
  bool hasPingMaxOut() => $_has(5);
  @protobuf.TagNumber(6)
  void clearPingMaxOut() => clearField(6);
}
