import 'package:flutter/material.dart';

import '../dto/budgetTransaction.dart';

class TransactionListBinding extends InheritedWidget {

  final List<BudgetTransaction> transactions;

  const TransactionListBinding({
    super.key,
    required super.child,
    required this.transactions
  });

  @override
  bool updateShouldNotify(TransactionListBinding oldWidget) {
    return oldWidget.transactions != transactions;
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
