import 'package:flutter/material.dart';
import 'package:future/screens/components/transactions/transaction_item.dart';
import 'package:future/bindings/budget_binding.dart';

class Transactions extends StatefulWidget {
  const Transactions({ super.key });

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  // final List<String> entries = <String>['A', 'B', 'C', 'D'];
  // final List<int> colorCodes = <int>[600, 500, 100, 200];
  // final List<BudgetTransaction> transactions = <BudgetTransaction>[
  //   BudgetTransaction(
  //     transactionBudgetId: '1231-daef-12de-120e',
  //     transactionAmount: 20.00,
  //     transactionDetails: 'Food',
  //     transactionTime: DateTime(2023, 07, 06),
  //     transactionType: 'Food'
  //   ),
  //   BudgetTransaction(
  //       transactionBudgetId: 'bce1-1092-12de-120e',
  //       transactionAmount: 17.00,
  //       transactionDetails: '2xCoffee & Noodles',
  //       transactionTime: DateTime(2023, 07, 06),
  //       transactionType: 'Household'
  //   ),
  //   BudgetTransaction(
  //       transactionBudgetId: '001a-deaf-12de-120e',
  //       transactionAmount: 8.20,
  //       transactionDetails: 'Breakfast',
  //       transactionTime: DateTime(2023, 07, 06),
  //       transactionType: 'Food'
  //   ),
  //   BudgetTransaction(
  //       transactionBudgetId: '1231-daef-12de-120e',
  //       transactionAmount: 32.63,
  //       transactionDetails: 'Monster curry',
  //       transactionTime: DateTime(2023, 06, 26),
  //       transactionType: 'Food'
  //   ),
  //   BudgetTransaction(
  //       transactionBudgetId: 'eadb-98af-12de-120e',
  //       transactionAmount: 51.00,
  //       transactionDetails: 'Plates',
  //       transactionTime: DateTime(2023, 07, 06),
  //       transactionType: 'Kitchen'
  //   )
  // ];

  @override
  Widget build(BuildContext context) {

    var transactions = TransactionListBinding.of(context).state.transactions;

    return ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 50),
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionItem(transaction: transactions[index]);
        }
    );
  }
}
