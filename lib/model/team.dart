class TeamMember {
  TeamMember({
    required this.id,
    required this.userName,
    required this.userID,
    this.ongoingTaskNo,
    required this.position,
    required this.positionID,
    required this.timeCreated,
    this.scheduleNo,
    this.imageUrl,
  });
  String id;
  String userName;
  String userID;
  String position;
  String positionID;
  String? imageUrl;
  String? ongoingTaskNo;
  String? scheduleNo;
  DateTime timeCreated;

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        id: json["id"],
        userName: json["userName"],
        userID: json['userID'],
        position: json["position"],
        positionID: json["positionID"],
        imageUrl: json["imageUrl"],
        ongoingTaskNo: json["ongoingTaskNo"],
        timeCreated: DateTime.parse(json["timeCreated"]),
        scheduleNo: json["scheduleNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userID": userID,
        "position": position,
        "positionID": positionID,
        "imageUrl": imageUrl,
        "ongoingTaskNo": ongoingTaskNo,
        "timeCreated": timeCreated.toIso8601String(),
        "scheduleNo": scheduleNo,
      };
}
