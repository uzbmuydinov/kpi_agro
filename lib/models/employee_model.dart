import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.username,
    required this.firstname,
    this.lastname,
    this.fathername,
    this.position,
    this.department,
    this.password,
  });

  int? id;
  String? username;
  late String firstname;
  String? lastname;
  String? fathername;
  Department? position;
  Department? department;
  dynamic password;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fathername: json["fathername"],
    position: json["position"] == null ? null : Department.fromJson(json["position"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "fathername": fathername,
    "position": position == null ? null : position?.toJson(),
    "department": department == null ? null : department?.toJson(),
    "password": password,
  };
}

class Department {
  Department({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
