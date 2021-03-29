import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:protobuf/protobuf.dart' as protobuf;

// File heavily copied from repository https://bitbucket.org/cstep/stan.dart

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

class PubMsg extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('PubMsg', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'clientID', protoName: 'clientID')
        ..aOS(2, 'guid')
        ..aOS(3, 'subject')
        ..aOS(4, 'reply')
        ..a<List<int>>(5, 'data', protobuf.PbFieldType.OY)
        ..a<List<int>>(6, 'connID', protobuf.PbFieldType.OY, protoName: 'connID')
        ..a<List<int>>(10, 'sha256', protobuf.PbFieldType.OY)
        ..hasRequiredFields = false;

  PubMsg._() : super();
  factory PubMsg() => create();
  factory PubMsg.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PubMsg.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PubMsg clone() => PubMsg()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static PubMsg create() => PubMsg._();
  PubMsg createEmptyInstance() => create();
  static protobuf.PbList<PubMsg> createRepeated() => protobuf.PbList<PubMsg>();
  @pragma('dart2js:noInline')
  static PubMsg getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<PubMsg>(create);
  static PubMsg? _defaultInstance;

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
  String get guid => $_getSZ(1);
  @protobuf.TagNumber(2)
  set guid(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasGuid() => $_has(1);
  @protobuf.TagNumber(2)
  void clearGuid() => clearField(2);

  @protobuf.TagNumber(3)
  String get subject => $_getSZ(2);
  @protobuf.TagNumber(3)
  set subject(String v) {
    $_setString(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasSubject() => $_has(2);
  @protobuf.TagNumber(3)
  void clearSubject() => clearField(3);

  @protobuf.TagNumber(4)
  String get reply => $_getSZ(3);
  @protobuf.TagNumber(4)
  set reply(String v) {
    $_setString(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasReply() => $_has(3);
  @protobuf.TagNumber(4)
  void clearReply() => clearField(4);

  @protobuf.TagNumber(5)
  List<int> get data => $_getN(4);
  @protobuf.TagNumber(5)
  set data(List<int> v) {
    $_setBytes(4, v);
  }

  @protobuf.TagNumber(5)
  bool hasData() => $_has(4);
  @protobuf.TagNumber(5)
  void clearData() => clearField(5);

  @protobuf.TagNumber(6)
  List<int> get connID => $_getN(5);
  @protobuf.TagNumber(6)
  set connID(List<int> v) {
    $_setBytes(5, v);
  }

  @protobuf.TagNumber(6)
  bool hasConnID() => $_has(5);
  @protobuf.TagNumber(6)
  void clearConnID() => clearField(6);

  @protobuf.TagNumber(10)
  List<int> get sha256 => $_getN(6);
  @protobuf.TagNumber(10)
  set sha256(List<int> v) {
    $_setBytes(6, v);
  }

  @protobuf.TagNumber(10)
  bool hasSha256() => $_has(6);
  @protobuf.TagNumber(10)
  void clearSha256() => clearField(10);
}

class SubscriptionRequest extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('SubscriptionRequest', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'clientID', protoName: 'clientID')
        ..aOS(2, 'subject')
        ..aOS(3, 'qGroup', protoName: 'qGroup')
        ..aOS(4, 'inbox')
        ..a<int>(5, 'maxInFlight', protobuf.PbFieldType.O3, protoName: 'maxInFlight')
        ..a<int>(6, 'ackWaitInSecs', protobuf.PbFieldType.O3, protoName: 'ackWaitInSecs')
        ..aOS(7, 'durableName', protoName: 'durableName')
        ..e<StartPosition>(10, 'startPosition', protobuf.PbFieldType.OE,
            protoName: 'startPosition',
            defaultOrMaker: StartPosition.NewOnly,
            valueOf: StartPosition.valueOf,
            enumValues: StartPosition.values)
        ..a<fixnum.Int64>(11, 'startSequence', protobuf.PbFieldType.OU6, protoName: 'startSequence', defaultOrMaker: fixnum.Int64.ZERO)
        ..aInt64(12, 'startTimeDelta', protoName: 'startTimeDelta')
        ..hasRequiredFields = false;

  SubscriptionRequest._() : super();
  factory SubscriptionRequest() => create();
  factory SubscriptionRequest.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionRequest.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SubscriptionRequest clone() => SubscriptionRequest()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static SubscriptionRequest create() => SubscriptionRequest._();
  SubscriptionRequest createEmptyInstance() => create();
  static protobuf.PbList<SubscriptionRequest> createRepeated() => protobuf.PbList<SubscriptionRequest>();
  @pragma('dart2js:noInline')
  static SubscriptionRequest getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<SubscriptionRequest>(create);
  static SubscriptionRequest? _defaultInstance;

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
  String get subject => $_getSZ(1);
  @protobuf.TagNumber(2)
  set subject(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasSubject() => $_has(1);
  @protobuf.TagNumber(2)
  void clearSubject() => clearField(2);

  @protobuf.TagNumber(3)
  String get qGroup => $_getSZ(2);
  @protobuf.TagNumber(3)
  set qGroup(String v) {
    $_setString(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasQGroup() => $_has(2);
  @protobuf.TagNumber(3)
  void clearQGroup() => clearField(3);

  @protobuf.TagNumber(4)
  String get inbox => $_getSZ(3);
  @protobuf.TagNumber(4)
  set inbox(String v) {
    $_setString(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasInbox() => $_has(3);
  @protobuf.TagNumber(4)
  void clearInbox() => clearField(4);

  @protobuf.TagNumber(5)
  int get maxInFlight => $_getIZ(4);
  @protobuf.TagNumber(5)
  set maxInFlight(int v) {
    $_setSignedInt32(4, v);
  }

  @protobuf.TagNumber(5)
  bool hasMaxInFlight() => $_has(4);
  @protobuf.TagNumber(5)
  void clearMaxInFlight() => clearField(5);

  @protobuf.TagNumber(6)
  int get ackWaitInSecs => $_getIZ(5);
  @protobuf.TagNumber(6)
  set ackWaitInSecs(int v) {
    $_setSignedInt32(5, v);
  }

  @protobuf.TagNumber(6)
  bool hasAckWaitInSecs() => $_has(5);
  @protobuf.TagNumber(6)
  void clearAckWaitInSecs() => clearField(6);

  @protobuf.TagNumber(7)
  String get durableName => $_getSZ(6);
  @protobuf.TagNumber(7)
  set durableName(String v) {
    $_setString(6, v);
  }

  @protobuf.TagNumber(7)
  bool hasDurableName() => $_has(6);
  @protobuf.TagNumber(7)
  void clearDurableName() => clearField(7);

  @protobuf.TagNumber(10)
  StartPosition get startPosition => $_getN(7);
  @protobuf.TagNumber(10)
  set startPosition(StartPosition v) {
    setField(10, v);
  }

  @protobuf.TagNumber(10)
  bool hasStartPosition() => $_has(7);
  @protobuf.TagNumber(10)
  void clearStartPosition() => clearField(10);

  @protobuf.TagNumber(11)
  fixnum.Int64 get startSequence => $_getI64(8);
  @protobuf.TagNumber(11)
  set startSequence(fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @protobuf.TagNumber(11)
  bool hasStartSequence() => $_has(8);
  @protobuf.TagNumber(11)
  void clearStartSequence() => clearField(11);

  @protobuf.TagNumber(12)
  fixnum.Int64 get startTimeDelta => $_getI64(9);
  @protobuf.TagNumber(12)
  set startTimeDelta(fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @protobuf.TagNumber(12)
  bool hasStartTimeDelta() => $_has(9);
  @protobuf.TagNumber(12)
  void clearStartTimeDelta() => clearField(12);
}

class SubscriptionResponse extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('SubscriptionResponse', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(2, 'ackInbox', protoName: 'ackInbox')
        ..aOS(3, 'error')
        ..hasRequiredFields = false;

  SubscriptionResponse._() : super();
  factory SubscriptionResponse() => create();
  factory SubscriptionResponse.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionResponse.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SubscriptionResponse clone() => SubscriptionResponse()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static SubscriptionResponse create() => SubscriptionResponse._();
  SubscriptionResponse createEmptyInstance() => create();
  static protobuf.PbList<SubscriptionResponse> createRepeated() => protobuf.PbList<SubscriptionResponse>();
  @pragma('dart2js:noInline')
  static SubscriptionResponse getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<SubscriptionResponse>(create);
  static SubscriptionResponse? _defaultInstance;

  @protobuf.TagNumber(2)
  String get ackInbox => $_getSZ(0);
  @protobuf.TagNumber(2)
  set ackInbox(String v) {
    $_setString(0, v);
  }

  @protobuf.TagNumber(2)
  bool hasAckInbox() => $_has(0);
  @protobuf.TagNumber(2)
  void clearAckInbox() => clearField(2);

  @protobuf.TagNumber(3)
  String get error => $_getSZ(1);
  @protobuf.TagNumber(3)
  set error(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(3)
  bool hasError() => $_has(1);
  @protobuf.TagNumber(3)
  void clearError() => clearField(3);
}

class UnsubscribeRequest extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('UnsubscribeRequest', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'clientID', protoName: 'clientID')
        ..aOS(2, 'subject')
        ..aOS(3, 'inbox')
        ..aOS(4, 'durableName', protoName: 'durableName')
        ..hasRequiredFields = false;

  UnsubscribeRequest._() : super();
  factory UnsubscribeRequest() => create();
  factory UnsubscribeRequest.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnsubscribeRequest.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  UnsubscribeRequest clone() => UnsubscribeRequest()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static UnsubscribeRequest create() => UnsubscribeRequest._();
  UnsubscribeRequest createEmptyInstance() => create();
  static protobuf.PbList<UnsubscribeRequest> createRepeated() => protobuf.PbList<UnsubscribeRequest>();
  @pragma('dart2js:noInline')
  static UnsubscribeRequest getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<UnsubscribeRequest>(create);
  static UnsubscribeRequest? _defaultInstance;

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
  String get subject => $_getSZ(1);
  @protobuf.TagNumber(2)
  set subject(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasSubject() => $_has(1);
  @protobuf.TagNumber(2)
  void clearSubject() => clearField(2);

  @protobuf.TagNumber(3)
  String get inbox => $_getSZ(2);
  @protobuf.TagNumber(3)
  set inbox(String v) {
    $_setString(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasInbox() => $_has(2);
  @protobuf.TagNumber(3)
  void clearInbox() => clearField(3);

  @protobuf.TagNumber(4)
  String get durableName => $_getSZ(3);
  @protobuf.TagNumber(4)
  set durableName(String v) {
    $_setString(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasDurableName() => $_has(3);
  @protobuf.TagNumber(4)
  void clearDurableName() => clearField(4);
}

class CloseRequest extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('CloseRequest', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'clientID', protoName: 'clientID')
        ..hasRequiredFields = false;

  CloseRequest._() : super();
  factory CloseRequest() => create();
  factory CloseRequest.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CloseRequest.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CloseRequest clone() => CloseRequest()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static CloseRequest create() => CloseRequest._();
  CloseRequest createEmptyInstance() => create();
  static protobuf.PbList<CloseRequest> createRepeated() => protobuf.PbList<CloseRequest>();
  @pragma('dart2js:noInline')
  static CloseRequest getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<CloseRequest>(create);
  static CloseRequest? _defaultInstance;

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
}

class CloseResponse extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('CloseResponse', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..aOS(1, 'error')
        ..hasRequiredFields = false;

  CloseResponse._() : super();
  factory CloseResponse() => create();
  factory CloseResponse.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CloseResponse.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CloseResponse clone() => CloseResponse()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static CloseResponse create() => CloseResponse._();
  CloseResponse createEmptyInstance() => create();
  static protobuf.PbList<CloseResponse> createRepeated() => protobuf.PbList<CloseResponse>();
  @pragma('dart2js:noInline')
  static CloseResponse getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<CloseResponse>(create);
  static CloseResponse? _defaultInstance;

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

class StartPosition extends protobuf.ProtobufEnum {
  static const StartPosition NewOnly = StartPosition._(0, 'NewOnly');
  static const StartPosition LastReceived = StartPosition._(1, 'LastReceived');
  static const StartPosition TimeDeltaStart = StartPosition._(2, 'TimeDeltaStart');
  static const StartPosition SequenceStart = StartPosition._(3, 'SequenceStart');
  static const StartPosition First = StartPosition._(4, 'First');

  static const List<StartPosition> values = <StartPosition>[
    NewOnly,
    LastReceived,
    TimeDeltaStart,
    SequenceStart,
    First,
  ];

  static final Map<int, StartPosition> _byValue = protobuf.ProtobufEnum.initByValue(values);
  static StartPosition? valueOf(int value) => _byValue[value];

  const StartPosition._(int v, String n) : super(v, n);
}

class MsgProto extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i =
      protobuf.BuilderInfo('MsgProto', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
        ..a<fixnum.Int64>(1, 'sequence', protobuf.PbFieldType.OU6, defaultOrMaker: fixnum.Int64.ZERO)
        ..aOS(2, 'subject')
        ..aOS(3, 'reply')
        ..a<List<int>>(4, 'data', protobuf.PbFieldType.OY)
        ..aInt64(5, 'timestamp')
        ..aOB(6, 'redelivered')
        ..a<int>(7, 'redeliveryCount', protobuf.PbFieldType.OU3, protoName: 'redeliveryCount')
        ..a<int>(10, 'CRC32', protobuf.PbFieldType.OU3, protoName: 'CRC32')
        ..hasRequiredFields = false;

  MsgProto._() : super();
  factory MsgProto() => create();
  factory MsgProto.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MsgProto.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MsgProto clone() => MsgProto()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static MsgProto create() => MsgProto._();
  MsgProto createEmptyInstance() => create();
  static protobuf.PbList<MsgProto> createRepeated() => protobuf.PbList<MsgProto>();
  @pragma('dart2js:noInline')
  static MsgProto getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<MsgProto>(create);
  static MsgProto? _defaultInstance;

  @protobuf.TagNumber(1)
  fixnum.Int64 get sequence => $_getI64(0);
  @protobuf.TagNumber(1)
  set sequence(fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasSequence() => $_has(0);
  @protobuf.TagNumber(1)
  void clearSequence() => clearField(1);

  @protobuf.TagNumber(2)
  String get subject => $_getSZ(1);
  @protobuf.TagNumber(2)
  set subject(String v) {
    $_setString(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasSubject() => $_has(1);
  @protobuf.TagNumber(2)
  void clearSubject() => clearField(2);

  @protobuf.TagNumber(3)
  String get reply => $_getSZ(2);
  @protobuf.TagNumber(3)
  set reply(String v) {
    $_setString(2, v);
  }

  @protobuf.TagNumber(3)
  bool hasReply() => $_has(2);
  @protobuf.TagNumber(3)
  void clearReply() => clearField(3);

  @protobuf.TagNumber(4)
  List<int> get data => $_getN(3);
  @protobuf.TagNumber(4)
  set data(List<int> v) {
    $_setBytes(3, v);
  }

  @protobuf.TagNumber(4)
  bool hasData() => $_has(3);
  @protobuf.TagNumber(4)
  void clearData() => clearField(4);

  @protobuf.TagNumber(5)
  fixnum.Int64 get timestamp => $_getI64(4);
  @protobuf.TagNumber(5)
  set timestamp(fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @protobuf.TagNumber(5)
  bool hasTimestamp() => $_has(4);
  @protobuf.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @protobuf.TagNumber(6)
  bool get redelivered => $_getBF(5);
  @protobuf.TagNumber(6)
  set redelivered(bool v) {
    $_setBool(5, v);
  }

  @protobuf.TagNumber(6)
  bool hasRedelivered() => $_has(5);
  @protobuf.TagNumber(6)
  void clearRedelivered() => clearField(6);

  @protobuf.TagNumber(7)
  int get redeliveryCount => $_getIZ(6);
  @protobuf.TagNumber(7)
  set redeliveryCount(int v) {
    $_setUnsignedInt32(6, v);
  }

  @protobuf.TagNumber(7)
  bool hasRedeliveryCount() => $_has(6);
  @protobuf.TagNumber(7)
  void clearRedeliveryCount() => clearField(7);

  @protobuf.TagNumber(10)
  int get cRC32 => $_getIZ(7);
  @protobuf.TagNumber(10)
  set cRC32(int v) {
    $_setUnsignedInt32(7, v);
  }

  @protobuf.TagNumber(10)
  bool hasCRC32() => $_has(7);
  @protobuf.TagNumber(10)
  void clearCRC32() => clearField(10);
}

class Ack extends protobuf.GeneratedMessage {
  static final protobuf.BuilderInfo _i = protobuf.BuilderInfo('Ack', package: const protobuf.PackageName('pb'), createEmptyInstance: create)
    ..aOS(1, 'subject')
    ..a<fixnum.Int64>(2, 'sequence', protobuf.PbFieldType.OU6, defaultOrMaker: fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  Ack._() : super();
  factory Ack() => create();
  factory Ack.fromBuffer(List<int> i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ack.fromJson(String i, [protobuf.ExtensionRegistry r = protobuf.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ack clone() => Ack()..mergeFromMessage(this);
  protobuf.BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Ack create() => Ack._();
  Ack createEmptyInstance() => create();
  static protobuf.PbList<Ack> createRepeated() => protobuf.PbList<Ack>();
  @pragma('dart2js:noInline')
  static Ack getDefault() => _defaultInstance ??= protobuf.GeneratedMessage.$_defaultFor<Ack>(create);
  static Ack? _defaultInstance;

  @protobuf.TagNumber(1)
  String get subject => $_getSZ(0);
  @protobuf.TagNumber(1)
  set subject(String v) {
    $_setString(0, v);
  }

  @protobuf.TagNumber(1)
  bool hasSubject() => $_has(0);
  @protobuf.TagNumber(1)
  void clearSubject() => clearField(1);

  @protobuf.TagNumber(2)
  fixnum.Int64 get sequence => $_getI64(1);
  @protobuf.TagNumber(2)
  set sequence(fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @protobuf.TagNumber(2)
  bool hasSequence() => $_has(1);
  @protobuf.TagNumber(2)
  void clearSequence() => clearField(2);
}
