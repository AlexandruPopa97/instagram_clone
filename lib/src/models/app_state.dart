part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b.auth = AuthState.initialState().toBuilder();
    });
  }
  AppState._();
  factory AppState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  AuthState get auth;

  static Serializer<AppState> get serializer => _$appStateSerializer;

  Map<String, dynamic> get json => serializers.deserializeWith(serializer, this) as Map<String, dynamic>;
}
