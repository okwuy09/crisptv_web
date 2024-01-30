class Ads {
  Ads({
    required this.id,
    required this.imageURL,
    required this.type,
  });

  String id;
  String imageURL;
  String type;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        id: json["id"] ?? '',
        imageURL: json["imageURL"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageURL": imageURL,
        "type": type,
      };
}
