class ForumModel {
  String id;
  String title;
  String authorName;
  String content;
  int category;
  DateTime publishedDate;
  int totalLikes;
  int totalReplies;

  ForumModel(
      {required this.id,
      required this.title,
      required this.authorName,
      required this.content,
      required this.category,
      required this.publishedDate,
      required this.totalLikes,
      required this.totalReplies});
}
