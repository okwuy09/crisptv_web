class Category {
  Category({
    required this.id,
    required this.name,
    required this.type,
  });

  String id;
  String name;
  String type;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}
