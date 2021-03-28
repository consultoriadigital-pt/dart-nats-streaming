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

class Ping extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('Ping', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..a<List<int>>(1, 'connID', protobuf.PbFieldType.OY, protoName: 'connID')
        ..hasRequiredFields = false;

  Ping._() : super();
  factory Ping() => create();
  factory Ping.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Ping.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ping clone() => Ping()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static protobuf.PbList<Ping> createRepeated() => protobuf.PbList<Ping>();
  @pragma('dart2js:noInline')
  static Ping getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;

  @protobuf.TagNumber(1)
  List<int> get connID => $_getN(0);
  @protobuf.TagNumber(1)
  set connID(List<int> v) {
    $_setBytes(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasConnID() => $_has(0);
  @protobuf.TagNumber(1)
  void clearConnID() => clearField(1);
}

class PingResponse extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('PingResponse', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'error')
        ..hasRequiredFields = false;

  PingResponse._() : super();
  factory PingResponse() => create();
  factory PingResponse.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PingResponse.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PingResponse clone() => PingResponse()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static PingResponse create() => PingResponse._();
  PingResponse createEmptyInstance() => create();
  static protobuf.PbList<PingResponse> createRepeated() => protobuf.PbList<PingResponse>();
  @pragma('dart2js:noInline')
  static PingResponse getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<PingResponse>(create);
  static PingResponse? _defaultInstance;

  @protobuf.TagNumber(1)
  String get error => $_getSZ(0);
  @protobuf.TagNumber(1)
  set error(String v) {
    $_setString(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasError() => $_has(0);
  @protobuf.TagNumber(1)
  void clearError() => clearField(1);
}

class ConnectResponse extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('ConnectResponse', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'pubPrefix', protoName: 'pubPrefix')
        ..aOS(2, 'subRequests', protoName: 'subRequests')
        ..aOS(3, 'unsubRequests', protoName: 'unsubRequests')
        ..aOS(4, 'closeRequests', protoName: 'closeRequests')
        ..aOS(5, 'error')
        ..aOS(6, 'subCloseRequests', protoName: 'subCloseRequests')
        ..aOS(7, 'pingRequests', protoName: 'pingRequests')
        ..a<int>(8, 'pingInterval', protobuf.PbFieldType.O3, protoName: 'pingInterval')
        ..a<int>(9, 'pingMaxOut', protobuf.PbFieldType.O3, protoName: 'pingMaxOut')
        ..a<int>(10, 'protocol', protobuf.PbFieldType.O3)
        ..aOS(100, 'publicKey', protoName: 'publicKey')
        ..hasRequiredFields = false;

  ConnectResponse._() : super();
  factory ConnectResponse() => create();
  factory ConnectResponse.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConnectResponse.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ConnectResponse clone() => ConnectResponse()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static ConnectResponse create() => ConnectResponse._();
  ConnectResponse createEmptyInstance() => create();
  static protobuf.PbList<ConnectResponse> createRepeated() => protobuf.PbList<ConnectResponse>();
  @pragma('dart2js:noInline')
  static ConnectResponse getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<ConnectResponse>(create);
  static ConnectResponse? _defaultInstance;

  @protobuf.TagNumber(1)
  String get pubPrefix => $_getSZ(0);
  @protobuf.TagNumber(1)
  set pubPrefix(String v) {
    $_setString(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasPubPrefix() => $_has(0);
  @protobuf.TagNumber(1)
  void clearPubPrefix() => clearField(1);

  @protobuf.TagNumber(2)
  String get subRequests => $_getSZ(1);
  @protobuf.TagNumber(2)
  set subRequests(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasSubRequests() => $_has(1);
  @protobuf.TagNumber(2)
  void clearSubRequests() => clearField(2);

  @protobuf.TagNumber(3)
  String get unsubRequests => $_getSZ(2);
  @protobuf.TagNumber(3)
  set unsubRequests(String v) {
    $_setString(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasUnsubRequests() => $_has(2);
  @protobuf.TagNumber(3)
  void clearUnsubRequests() => clearField(3);

  @protobuf.TagNumber(4)
  String get closeRequests => $_getSZ(3);
  @protobuf.TagNumber(4)
  set closeRequests(String v) {
    $_setString(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasCloseRequests() => $_has(3);
  @protobuf.TagNumber(4)
  void clearCloseRequests() => clearField(4);

  @protobuf.TagNumber(5)
  String get error => $_getSZ(4);
  @protobuf.TagNumber(5)
  set error(String v) {
    $_setString(4, v);
  }

  @protobuf.TagNumber(5)
  bool hasError() => $_has(4);
  @protobuf.TagNumber(5)
  void clearError() => clearField(5);

  @protobuf.TagNumber(6)
  String get subCloseRequests => $_getSZ(5);
  @protobuf.TagNumber(6)
  set subCloseRequests(String v) {
    $_setString(5, v);
  }

  @protobuf.TagNumber(6)
  bool hasSubCloseRequests() => $_has(5);
  @protobuf.TagNumber(6)
  void clearSubCloseRequests() => clearField(6);

  @protobuf.TagNumber(7)
  String get pingRequests => $_getSZ(6);
  @protobuf.TagNumber(7)
  set pingRequests(String v) {
    $_setString(6, v);
  }

  @protobuf.TagNumber(7)
  bool hasPingRequests() => $_has(6);
  @protobuf.TagNumber(7)
  void clearPingRequests() => clearField(7);

  @protobuf.TagNumber(8)
  int get pingInterval => $_getIZ(7);
  @protobuf.TagNumber(8)
  set pingInterval(int v) {
    $_setSignedInt32(7, v);
  }

  @protobuf.TagNumber(8)
  bool hasPingInterval() => $_has(7);
  @protobuf.TagNumber(8)
  void clearPingInterval() => clearField(8);

  @protobuf.TagNumber(9)
  int get pingMaxOut => $_getIZ(8);
  @protobuf.TagNumber(9)
  set pingMaxOut(int v) {
    $_setSignedInt32(8, v);
  }

  @protobuf.TagNumber(9)
  bool hasPingMaxOut() => $_has(8);
  @protobuf.TagNumber(9)
  void clearPingMaxOut() => clearField(9);

  @protobuf.TagNumber(10)
  int get protocol => $_getIZ(9);
  @protobuf.TagNumber(10)
  set protocol(int v) {
    $_setSignedInt32(9, v);
  }

  @protobuf.TagNumber(10)
  bool hasProtocol() => $_has(9);
  @protobuf.TagNumber(10)
  void clearProtocol() => clearField(10);

  @protobuf.TagNumber(100)
  String get publicKey => $_getSZ(10);
  @protobuf.TagNumber(100)
  set publicKey(String v) {
    $_setString(10, v);
  }

  @protobuf.TagNumber(100)
  bool hasPublicKey() => $_has(10);
  @protobuf.TagNumber(100)
  void clearPublicKey() => clearField(100);
}
