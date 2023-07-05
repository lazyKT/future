
class BudgetCategoryActivity {

  final String activityId;
  final String budgetCatId;
  final String budgetCatMemberId;
  final String userId;
  final String transactionId;

  BudgetCategoryActivity({
    required this.activityId,
    required this.budgetCatId,
    required this.userId,
    required this.transactionId,
    required this.budgetCatMemberId
  });

  factory BudgetCategoryActivity.fromJson(Map<String, dynamic> json) => BudgetCategoryActivity(
    activityId: json['activityId'],
    budgetCatId: json['budgetCatId'],
    userId: json['userId'],
    transactionId: json['transactionId'],
    budgetCatMemberId: json['budgetCatMemberId']
  );
}