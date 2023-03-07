class ForumReplyModel {
  String replyId;
  String forumId;
  String authorName;
  String content;

  ForumReplyModel(
      {required this.replyId,
      required this.forumId,
      required this.authorName,
      required this.content});
}
