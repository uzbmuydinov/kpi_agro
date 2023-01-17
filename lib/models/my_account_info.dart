import 'dart:convert';

MyAccountInfo myAccountInfoFromJson(String str) => MyAccountInfo.fromJson(json.decode(str));

String myAccountInfoToJson(MyAccountInfo data) => json.encode(data.toJson());

class MyAccountInfo {
  MyAccountInfo({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
  });

  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  dynamic? createdDate;
  String? lastModifiedBy;
  dynamic? lastModifiedDate;
  List<String>? authorities;

  factory MyAccountInfo.fromJson(Map<String, dynamic> json) => MyAccountInfo(
    id: json["id"],
    login: json["login"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    activated: json["activated"],
    langKey: json["langKey"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: json["lastModifiedDate"],
    authorities: List<String>.from(json["authorities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageUrl": imageUrl,
    "activated": activated,
    "langKey": langKey,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate,
    "authorities": List<dynamic>.from(authorities!.map((x) => x)),
  };
}
