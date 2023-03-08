class VideoModel {
  String id;
  String title;
  String authorName;
  String thumbnailUrl;
  double rating;
  bool isForPregnancy;

  VideoModel(
      {required this.id,
      required this.title,
      required this.authorName,
      required this.thumbnailUrl,
      required this.rating,
      required this.isForPregnancy});
}
