class Posts {
  Posts({
    required this.id,
    required this.posterName,
    required this.title,
    required this.writeUp,
    required this.likes,
    required this.categoryID,
    required this.image,
    required this.time,
    required this.videoUrl,
    required this.postType,
    this.allowComment,
  });

  String id;
  String posterName;
  String title;
  String writeUp;
  String image;
  String videoUrl;
  String postType;
  String categoryID;
  DateTime time;
  List likes;
  bool? allowComment;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        posterName: json["posterName"],
        title: json["title"],
        writeUp: json["writeUp"],
        likes: json["likes"],
        categoryID: json["categoryID"],
        image: json["image"],
        time: DateTime.parse(json["time"]),
        videoUrl: json["videoUrl"],
        allowComment: json["allowComment"],
        postType: json["postType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "posterName": posterName,
        "title": title,
        "writeUp": writeUp,
        "likes": likes,
        "categoryID": categoryID,
        "image": image,
        "time": time.toIso8601String(),
        "videoUrl": videoUrl,
        "postType": postType,
        "allowComment": allowComment,
      };
}
