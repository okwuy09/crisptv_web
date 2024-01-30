class Slide {
  Slide({
    required this.id,
    required this.imageURL,
  });

  String id;
  List imageURL;

  factory Slide.fromJson(Map<String, dynamic> json) =>
      Slide(id: json["id"] ?? '', imageURL: json["imageURL"] as List);

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageURL": imageURL,
      };
}
