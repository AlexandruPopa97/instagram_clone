part of auth_models;

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([void Function(AppUserBuilder b) updates]) = _$AppUser;

  factory AppUser.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  AppUser._();

  String get uid;

  String get mail;

  String get username;

  @nullable
  String get photoUrl;

  static Serializer<AppUser> get serializer => _$appUserSerializer;

  Map<String, dynamic> get json => serializers.deserializeWith(serializer, this) as Map<String, dynamic>;
}
