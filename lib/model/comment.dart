class Comments {
  Comments({
    required this.id,
    required this.userName,
    required this.writeUp,
    required this.likes,
    required this.userImage,
    required this.time,
  });

  String id;
  String userName;
  String writeUp;
  String userImage;
  DateTime time;
  List likes;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["id"],
        userName: json["userName"],
        writeUp: json["writeUp"],
        likes: json["likes"],
        userImage: json["userImage"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "writeUp": writeUp,
        "likes": likes,
        "userImage": userImage,
        "time": time.toIso8601String(),
      };
}
