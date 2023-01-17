import 'dart:convert';

TasksModel tasksModelFromJson(String str) => TasksModel.fromJson(json.decode(str));

String tasksModelToJson(TasksModel data) => json.encode(data.toJson());

class TasksModel {
  TasksModel({
    required this.id,
    required this.createdAt,
    this.task,
    this.from,
  });

  int id;
  DateTime createdAt;
  Task? task;
  From? from;

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    task: Task.fromJson(json["task"]),
    from: From.fromJson(json["from"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "task": task?.toJson(),
    "from": from?.toJson(),
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
  String? username;
  String? firstname;
  String? lastname;
  String? fathername;
  Department? position;
  Department? department;
  String? password;

  factory From.fromJson(Map<String, dynamic> json) => From(
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
    "position": position!.toJson(),
    "department": department!.toJson(),
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

class Task {
  Task({
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
  String? filename;
  String? status;
  String? flow;
  DateTime? deadline;
  DateTime? acceptedAt;
  DateTime? createdAt;
  DateTime? finishedAt;
  int? difficulty;
  String? priority;
  From? from;
  List<From>? tos;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    filename: json["filename"],
    status: json["status"],
    flow: json["flow"],
    deadline: DateTime.parse(json["deadline"]),
    acceptedAt: DateTime.parse(json["acceptedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    finishedAt: DateTime.parse(json["finishedAt"]),
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
    "deadline": deadline.toString(),
    "acceptedAt": acceptedAt.toString(),
    "createdAt": createdAt.toString(),
    "finishedAt": finishedAt.toString(),
    "difficulty": difficulty,
    "priority": priority,
    "from": from!.toJson(),
    "tos": List<dynamic>.from(tos!.map((x) => x.toJson())),
  };
}
