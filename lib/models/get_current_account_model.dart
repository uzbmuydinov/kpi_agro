import 'dart:convert';

GetCurrentAccountModel getCurrentAccountModelFromJson(String str) => GetCurrentAccountModel.fromJson(json.decode(str));

String getCurrentAccountModelToJson(GetCurrentAccountModel data) => json.encode(data.toJson());

class GetCurrentAccountModel {
  GetCurrentAccountModel({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.fathername,
    required this.position,
    required this.department,
    this.password,
  });

  int id;
  String? username;
  String? firstname;
  String? lastname;
  String? fathername;
  Department? position;
  Department? department;
  dynamic? password;

  factory GetCurrentAccountModel.fromJson(Map<String, dynamic> json) => GetCurrentAccountModel(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fathername: json["fathername"],
    position: Department.fromJson(json["position"]),
    department: Department.fromJson(json["department"]),
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "fathername": fathername,
    "position": position?.toJson(),
    "department": department?.toJson(),
    "password": password,
  };
}

class Department {
  Department({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
