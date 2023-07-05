
import 'package:uuid/uuid.dart';

enum BudgetCategoryMemberPermission { high, mid, low }

class BudgetCategoryMember {

  final String budgetMemberId;
  final String budgeCategoryId;
  final String budgetCategoryMember;
  final DateTime joinedAt;
  BudgetCategoryMemberPermission memberPermission;

  BudgetCategoryMember({
    required this.budgetCategoryMember,
    required this.budgeCategoryId,
    required this.memberPermission
  }) : joinedAt = DateTime.now(),
        budgetMemberId = (const Uuid()).v4();

  // named constructor
  BudgetCategoryMember.named({
    required this.budgetMemberId,
    required this.budgetCategoryMember,
    required this.budgeCategoryId,
    required this.memberPermission,
    required this.joinedAt
  });

  factory BudgetCategoryMember.formJson(Map<String, dynamic> json) => BudgetCategoryMember.named(
    budgeCategoryId: json['budgetCategoryId'],
    budgetCategoryMember: json['budgetCategoryMember'],
    budgetMemberId: json['budgetMemberId'],
    memberPermission: json['memberPermission'],
    joinedAt: DateTime.parse(json['joinedAt'])
  );
}