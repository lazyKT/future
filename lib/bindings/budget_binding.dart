import 'package:flutter/material.dart';
import 'package:future/state/budget_state.dart';

class BudgetTransactionBinding extends InheritedWidget {

  final BudgetState state;

  const BudgetTransactionBinding({
    super.key,
    required super.child,
    required this.state
  });

  @override
  bool updateShouldNotify(BudgetTransactionBinding oldWidget) {
    var oldState = oldWidget.state;
    if (oldState.budgetCategory == null || state.budgetCategory == null) {
      return false;
    }
    return (
      oldState.budgetCategory!.budgetCatID != state.budgetCategory!.budgetCatID ||
      oldState.transactions.length != state.transactions.length
    );
  }

  static BudgetTransactionBinding? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BudgetTransactionBinding>();
  }

  static BudgetTransactionBinding of(BuildContext context) {
    final binding = BudgetTransactionBinding.maybeOf(context);
    assert(binding != null, "TransactionBinding is null in the context");
    return binding!;
  }
}
