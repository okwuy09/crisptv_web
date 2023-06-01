class Tasks {
  Tasks({
    required this.id,
    required this.assignee,
    required this.dateCreated,
    required this.dueDate,
    required this.status,
    required this.taskName,
  });
  String id;
  String taskName;
  String status;
  String assignee;
  DateTime dueDate;
  DateTime dateCreated;

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        id: json["id"],
        taskName: json["taskName"],
        status: json['status'],
        assignee: json["assignee"],
        dueDate: DateTime.parse(json["dueDate"]),
        dateCreated: DateTime.parse(json["dateCreated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "taskName": taskName,
        "status": status,
        "assignee": assignee,
        "dueDate": dueDate.toIso8601String(),
        "dateCreated": dateCreated.toIso8601String(),
      };
}
