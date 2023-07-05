
import 'package:uuid/uuid.dart';

enum BudgetCategoryType { personal, joint }

class BudgetCategory {

  final String budgetCatID;
  final String budgetCatOwner;
  final DateTime createdAt;
  String budgetCatName;
  double budgetCatIncome;
  double budgetCatTarget;
  double budgetCatBalance;
  BudgetCategoryType budgetCatType;

  BudgetCategory({
    required this.budgetCatOwner,
    required this.budgetCatName,
    required this.budgetCatIncome,
    required this.budgetCatTarget,
    required this.budgetCatBalance,
    required this.budgetCatType,
    required budgetCatID,
  }) : createdAt = DateTime.now(),
        budgetCatID = (const Uuid()).v4();

  // name constructor
  BudgetCategory.named({
    required this.budgetCatOwner,
    required this.budgetCatName,
    required this.budgetCatIncome,
    required this.budgetCatTarget,
    required this.budgetCatBalance,
    required this.budgetCatType,
    required this.budgetCatID,
    required this.createdAt
  });

  factory BudgetCategory.fromJson(Map<String, dynamic> json) => BudgetCategory.named(
    budgetCatID: json['budgetCatID'],
    budgetCatType: json['budgetCatType'],
    budgetCatOwner: json['budgetCatOwner'],
    budgetCatName: json['budgetCatName'],
    budgetCatIncome: json['budgetCatIncome'],
    budgetCatBalance: json['budgetCatBalance'],
    budgetCatTarget: json['budgetCatTarget'],
    createdAt: DateTime.parse(json['createdAt'])
  );
}