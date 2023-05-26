class Users {
  Users({
    this.id,
    this.email,
    this.fullName,
    this.avatar,
    this.banned,
    this.dateCreated,
  });

  String? id;
  String? email;
  String? fullName;
  String? avatar;
  bool? banned;
  DateTime? dateCreated;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        fullName: json["full_name"],
        avatar: json["avatar"],
        banned: json["banned"],
        dateCreated: DateTime.parse(json["date_created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "full_name": fullName,
        "avatar": avatar,
        "banned": banned,
        "date_created": dateCreated!.toIso8601String(),
      };
}
