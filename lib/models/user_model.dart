class UserModel {
  String id;
  String name;
  String email;
  String childAge;
  String childGender;
  String appUsageDuration;
  String numOfTimesPregnant;
  String parentType;
  bool isPregnant;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.childAge,
      required this.childGender,
      required this.appUsageDuration,
      required this.numOfTimesPregnant,
      required this.parentType,
      required this.isPregnant});
}
