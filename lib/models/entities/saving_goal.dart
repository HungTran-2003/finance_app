
import 'package:finance_app/common/app_svgs.dart';

class SavingGoalEntity {
  int? id;
  String? title;
  double? targetAmount;
  double? currentAmount;
  DateTime? startDate;
  DateTime? endDate;
  bool? isCompleted;
  String? iconPath;
  bool? follow;

  SavingGoalEntity({
    this.id,
    this.title,
    this.targetAmount,
    this.currentAmount,
    this.startDate,
    this.endDate,
    this.isCompleted,
    this.iconPath,
    this.follow,
  });

  static List<SavingGoalEntity> get mockData {
    return [
      SavingGoalEntity(id: 1, title: "Buy Lamborghini", targetAmount: 700000, currentAmount: 500, startDate: DateTime(2025, 12,1), isCompleted: false, iconPath: AppSVGs.car, follow: true)
      ];
  }
}
