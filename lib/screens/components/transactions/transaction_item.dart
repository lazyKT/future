import 'package:flutter/material.dart';
import 'package:future/dto/budgetTransaction.dart';
import 'package:future/screens/components/transactions/transaction_cat_icon.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {

  final BudgetTransaction transaction;

  const TransactionItem({
    super.key,
    required this.transaction
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        transaction.transactionDetails,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'mono-space',
          fontSize: 17.0
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: TransactionCategoryIcon(transactionCategory: transaction.transactionType),
      ),
      subtitle: Text(formatDate(transaction.transactionTime)),
      trailing: Text(
        '\$ ${transaction.transactionAmount}',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'sans-serif',
          letterSpacing: -1,
          fontSize: 17
        ),
      ),
    );
  }

  String formatDate(DateTime dt) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dt);
  }
}
