class ForumReplyModel {
  String replyId;
  String forumId;
  String authorName;
  String content;
  String publishedDate;

  ForumReplyModel(
      {required this.replyId,
      required this.forumId,
      required this.authorName,
      required this.content,
      required this.publishedDate});
}
