import 'package:finance_app/models/enum/categories.dart';

class TransactionEntity {
  int? id;
  Categories? category;
  DateTime? createAt;
  double? amount;
  String? title;
  String? note;
  bool? isIncome;

  TransactionEntity({
    this.id,
    this.category,
    this.createAt,
    this.amount,
    this.title,
    this.note,
    this.isIncome,
  });

  static List<TransactionEntity> get mockData {
    return [
      TransactionEntity(id: 1, category: Categories.food, createAt: DateTime.now(), amount: 1000, title: "Food", isIncome: true, note: "ngon"),
      TransactionEntity(id: 2, category: Categories.rent, createAt: DateTime.now(), amount: 20, title: "Rent", isIncome: false),
      TransactionEntity(id: 3, category: Categories.transport, createAt: DateTime.now(), amount: 1200, title: "Transport",isIncome: true),
      TransactionEntity(id: 4, category: Categories.grocery, createAt: DateTime.now(), amount: 1300, title: "Grocery",isIncome: false),
      TransactionEntity(id: 5, category: Categories.gift, createAt: DateTime.now(), amount: 1400, title: "Gift",isIncome: true),
      TransactionEntity(id: 6, category: Categories.medicine, createAt: DateTime.now(), amount: 1500, title: "Medicine",isIncome: true),
      TransactionEntity(id: 7, category: Categories.entertainment, createAt: DateTime.now(), amount: 1600, title: "Entertainment",isIncome: false),
      TransactionEntity(id: 8, category: Categories.saving, createAt: DateTime.now(), amount: 1700, title: "Saving",isIncome: true),
      TransactionEntity(id: 9, category: Categories.more, createAt: DateTime.now(), amount: 1800, title: "More",isIncome: false)
    ];
  }
}
