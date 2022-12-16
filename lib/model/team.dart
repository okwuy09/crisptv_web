class TeamMember {
  TeamMember({
    this.articleNo,
    required this.name,
    this.ongoingTaskNo,
    required this.position,
    this.scheduleNo,
    this.videoNo,
    this.imageUrl,
  });
  String name;
  String position;
  String? imageUrl;
  int? articleNo;
  int? videoNo;
  int? ongoingTaskNo;
  int? scheduleNo;
}
