import '../data/milestone_data.dart';

class MilestoneModel {
  String milestone;
  int week;
  int trimester;
  bool isPassed;
  bool isBolded;

  MilestoneModel(
      {required this.milestone,
      required this.week,
      required this.trimester,
      required this.isPassed,
      required this.isBolded});
}

String getWeekRange(int trimester) {
  String weekRange = '';
  switch (trimester) {
    case 1:
      weekRange = 'Week 1-13';
      break;
    case 2:
      weekRange = 'Week 14-27';
      break;
    case 3:
      weekRange = 'Week 28-41';
      break;
  }
  return weekRange;
}

List<int> getUniqueWeek(int trimester) {
  List<int> tempUniqueWeek = [];
  milestoneData.forEach((element) {
    if (element.trimester == trimester) {
      tempUniqueWeek.add(element.week);
    }
  });
  List<int> uniqueWeek = tempUniqueWeek.toSet().toList();
  return uniqueWeek;
}

List<MilestoneModel> getMilestoneContentByTrimester(int trimester) {
  List<MilestoneModel> milestoneModel = [];
  milestoneData.forEach((element) {
    if (element.trimester == trimester) {
      milestoneModel.add(element);
    }
  });
  return milestoneModel;
}

int getTrimesterFromWeek(int currentWeek) {
  if (currentWeek <= 12) {
    return 1;
  } else if (currentWeek > 12 && currentWeek <= 26) {
    return 2;
  } else if (currentWeek > 26) {
    return 3;
  } else
    return 0;
}
