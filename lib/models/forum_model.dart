class ForumModel {
  String id;
  String title;
  String authorName;
  String content;
  int category;
  DateTime publishedDate;
  int totalLike;
  int totalReply;

  ForumModel(
      {required this.id,
      required this.title,
      required this.authorName,
      required this.content,
      required this.category,
      required this.publishedDate,
      required this.totalLike,
      required this.totalReply});
}
