import 'package:flutter/material.dart';
import 'package:future/state/budget_state.dart';

class TransactionListBinding extends InheritedWidget {

  final BudgetState state;

  const TransactionListBinding({
    super.key,
    required super.child,
    required this.state
  });

  @override
  bool updateShouldNotify(TransactionListBinding oldWidget) {
    var oldState = oldWidget.state;
    if (oldState.budgetCategory == null || state.budgetCategory == null) {
      return false;
    }
    return (
      oldState.budgetCategory!.budgetCatID != state.budgetCategory!.budgetCatID ||
      oldState.transactions.length != state.transactions.length
    );
  }

  static TransactionListBinding? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TransactionListBinding>();
  }

  static TransactionListBinding of(BuildContext context) {
    final binding = TransactionListBinding.maybeOf(context);
    assert(binding != null, "TransactionBinding is null in the context");
    return binding!;
  }
}
