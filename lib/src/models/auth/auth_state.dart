part of auth_models;

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  factory AuthState.initialState() {
    return _$AuthState();
  }
  AuthState._();

  factory AuthState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  @nullable
  AppUser get user;

  static Serializer<AuthState> get serializer => _$authStateSerializer;

  Map<String, dynamic> get json => serializers.deserializeWith(serializer, this) as Map<String, dynamic>;
}
