class ContentModel {
  String id;
  String title;
  List<String> content;
  List<String> suitableCategories;

  ContentModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.suitableCategories});
}
