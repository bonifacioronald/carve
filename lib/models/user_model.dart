class UserModel {
  String id;
  String name;
  String email;
  String childAge;
  String childGender;
  String appUsageDuration;
  String parentingStyle;
  bool isPregnant;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.childAge,
      required this.childGender,
      required this.appUsageDuration,
      required this.parentingStyle,
      required this.isPregnant});
}
