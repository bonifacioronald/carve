class ContentModel {
  String id;
  String title;
  List<String> content;
  List<String> suitableCategories;
  String thumbnailUrl;

  ContentModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.suitableCategories,
      required this.thumbnailUrl});
}

