class UserModel {
  String id;
  String name;
  String email;
  String childAge;
  String childGender;
  String complication;
  String numOfTimesPregnant;
  String parentType;
  bool isPregnant;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.childAge,
      required this.childGender,
      required this.complication,
      required this.numOfTimesPregnant,
      required this.parentType,
      required this.isPregnant});
}
