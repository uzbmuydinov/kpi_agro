import 'dart:convert';

AuthTokenModel authTokenModelFromJson(String str) => AuthTokenModel.fromJson(json.decode(str));

String authTokenModelToJson(AuthTokenModel data) => json.encode(data.toJson());

class AuthTokenModel {
  AuthTokenModel({
    required this.username,
    required this.password,
    this.rememberMe,
  });

  String username;
  String password;
  bool? rememberMe;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => AuthTokenModel(
    username: json["username"],
    password: json["password"],
    rememberMe: json["rememberMe"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "rememberMe": rememberMe,
  };
}
