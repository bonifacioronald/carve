class UserModel {
  String id;
  String name;
  String email;
  String childAge;
  String childGender;
  String appUsageDuration;
  String parentingStyle;
  String parentType;
  bool isPregnant;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.childAge,
      required this.childGender,
      required this.appUsageDuration,
      required this.parentingStyle,
      required this.parentType,
      required this.isPregnant});
}
