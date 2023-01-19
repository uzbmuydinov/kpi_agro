import 'dart:convert';

List<GetAllTasksModel> getAllTasksModelFromJson(String str) => List<GetAllTasksModel>.from(json.decode(str).map((x) => GetAllTasksModel.fromJson(x)));

String getAllTasksModelToJson(List<GetAllTasksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTasksModel {
  GetAllTasksModel({
    required this.id,
    required this.title,
    required this.description,
    this.filename,
    required this.status,
    required this.flow,
    required this.deadline,
    this.acceptedAt,
    required this.createdAt,
    this.finishedAt,
    required this.difficulty,
    required this.priority,
    required this.from,
    required this.tos,
  });

  int id;
  String title;
  String description;
  dynamic filename;
  String status;
  String flow;
  DateTime deadline;
  dynamic acceptedAt;
  DateTime createdAt;
  dynamic finishedAt;
  int difficulty;
  String priority;
  From from;
  List<From> tos;

  factory GetAllTasksModel.fromJson(Map<String, dynamic> json) => GetAllTasksModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    filename: json["filename"],
    status: json["status"],
    flow: json["flow"],
    deadline: DateTime.parse(json["deadline"]),
    acceptedAt: json["acceptedAt"],
    createdAt: DateTime.parse(json["createdAt"]),
    finishedAt: json["finishedAt"],
    difficulty: json["difficulty"],
    priority: json["priority"],
    from: From.fromJson(json["from"]),
    tos: List<From>.from(json["tos"].map((x) => From.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "filename": filename,
    "status": status,
    "flow": flow,
    "deadline": deadline.toIso8601String(),
    "acceptedAt": acceptedAt,
    "createdAt": createdAt.toIso8601String(),
    "finishedAt": finishedAt,
    "difficulty": difficulty,
    "priority": priority,
    "from": from.toJson(),
    "tos": List<dynamic>.from(tos.map((x) => x.toJson())),
  };
}

class From {
  From({
    required this.id,
    this.username,
    required this.firstname,
    required this.lastname,
    this.fathername,
    this.position,
    this.department,
    this.password,
  });

  int id;
  dynamic username;
  String firstname;
  String lastname;
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
