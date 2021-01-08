part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState.initialState()
  {
    return _$AppState();
  }
  AppState._();
  factory AppState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  static Serializer<AppState> get serializer => _$appStateSerializer;

  Map<String, dynamic> get json => serializers.deserializeWith(serializer, this) as Map<String, dynamic>;

}
