class ContentModel {
  String contentTitle;
  String contentDetails;
  int contentAmount;
  bool isTitleScreen;

  ContentModel(
      {required this.contentTitle,
      required this.contentAmount,
      required this.contentDetails,
      required this.isTitleScreen});
}
