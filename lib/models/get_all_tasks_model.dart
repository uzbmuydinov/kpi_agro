import 'dart:convert';

List<GetTaskModel?>? getTaskModelFromJson(String str) => json.decode(str) == null ? [] : List<GetTaskModel?>.from(json.decode(str)!.map((x) => GetTaskModel.fromJson(x)));

String getTaskModelToJson(List<GetTaskModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class GetTaskModel {
  GetTaskModel({
    this.id,
    this.title,
    this.description,
    this.filename,
    this.status,
    this.flow,
    this.deadline,
    this.acceptedAt,
    this.createdAt,
    this.finishedAt,
    this.difficulty,
    this.priority,
    this.from,
    this.tos,
  });

  int? id;
  String? title;
  String? description;
  dynamic filename;
  String? status;
  String? flow;
  DateTime? deadline;
  DateTime? acceptedAt;
  DateTime? createdAt;
  dynamic finishedAt;
  int? difficulty;
  String? priority;
  From? from;
  List<From?>? tos;

  factory GetTaskModel.fromJson(Map<String, dynamic> json) => GetTaskModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    filename: json["filename"],
    status: json["status"],
    flow: json["flow"],
    deadline: DateTime.parse(json["deadline"]),
    acceptedAt: DateTime.parse(json["acceptedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    finishedAt: json["finishedAt"],
    difficulty: json["difficulty"],
    priority: json["priority"],
    from: From.fromJson(json["from"]),
    tos: json["tos"] == null ? [] : List<From?>.from(json["tos"]!.map((x) => From.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "filename": filename,
    "status": status,
    "flow": flow,
    "deadline": deadline?.toIso8601String(),
    "acceptedAt": acceptedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "finishedAt": finishedAt,
    "difficulty": difficulty,
    "priority": priority,
    "from": from!.toJson(),
    "tos": tos == null ? [] : List<dynamic>.from(tos!.map((x) => x!.toJson())),
  };
}

class From {
  From({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.fathername,
    this.position,
    this.department,
    this.password,
  });

  int? id;
  dynamic username;
  String? firstname;
  String? lastname;
  dynamic fathername;
  dynamic position;
  dynamic department;
  dynamic password;

  factory From.fromJson(Map<String, dynamic> json) => From(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fathername: json["fathername"],
    position: json["position"],
    department: json["department"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "fathername": fathername,
    "position": position,
    "department": department,
    "password": password,
  };
}
