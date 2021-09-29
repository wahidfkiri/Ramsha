import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User{
  @JsonKey()
  int id;
  @JsonKey()
  String name;
  @JsonKey()
  String email;
  @JsonKey()
  String password;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}