import 'package:flutter/material.dart';
import 'package:future/screens/components/transactions/transaction_item.dart';
import 'package:future/bindings/budget_binding.dart';

class Transactions extends StatefulWidget {
  const Transactions({ super.key });

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  @override
  Widget build(BuildContext context) {

    var transactions = BudgetTransactionBinding.of(context).state.transactions;

    return ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 50),
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionItem(transaction: transactions[index]);
        }
    );
  }
}
