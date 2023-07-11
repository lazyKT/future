import 'package:flutter/material.dart';
import 'package:future/screens/components/budget_plan_highlight.dart';
import 'package:future/screens/components/reusable/expandable_fab/expandable_fab.dart';
import 'package:future/screens/components/transactions/transactions.dart';

import '../bindings/transaction_binding.dart';
import '../dto/budgetTransaction.dart';
import 'components/reusable/expandable_fab/action_button.dart';

class Home extends StatefulWidget {

  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<BudgetTransaction> transactions = <BudgetTransaction>[
    BudgetTransaction(
        transactionBudgetId: '1231-daef-12de-120e',
        transactionAmount: 20.00,
        transactionDetails: 'Food',
        transactionTime: DateTime(2023, 07, 06),
        transactionType: 'Food'
    ),
    BudgetTransaction(
        transactionBudgetId: 'bce1-1092-12de-120e',
        transactionAmount: 17.00,
        transactionDetails: '2xCoffee & Noodles',
        transactionTime: DateTime(2023, 07, 06),
        transactionType: 'Household'
    ),
    BudgetTransaction(
        transactionBudgetId: '001a-deaf-12de-120e',
        transactionAmount: 8.20,
        transactionDetails: 'Breakfast',
        transactionTime: DateTime(2023, 07, 06),
        transactionType: 'Food'
    ),
    BudgetTransaction(
        transactionBudgetId: '00ab-89ca-12de-120e',
        transactionAmount: 83.33,
        transactionDetails: 'Fuji Treats',
        transactionTime: DateTime(2023, 06, 26),
        transactionType: 'Pet'
    ),
    BudgetTransaction(
        transactionBudgetId: '1231-daef-12de-120e',
        transactionAmount: 32.63,
        transactionDetails: 'Monster curry',
        transactionTime: DateTime(2023, 06, 26),
        transactionType: 'Food'
    ),
    BudgetTransaction(
        transactionBudgetId: 'eadb-98af-12de-120e',
        transactionAmount: 51.00,
        transactionDetails: 'Plates',
        transactionTime: DateTime(2023, 07, 06),
        transactionType: 'Kitchen'
    )
  ];

  @override
  Widget build (BuildContext context) {
    return TransactionListBinding(
      transactions: transactions,
      child: Scaffold(
        backgroundColor: Colors.white38,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // current spending
            const Expanded(
              flex: 1,
              child: BudgetHighlight(),
            ),
            // Expanded(
            //   flex: 3,
            //   child: BudgetLineChart(transactions),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 17.00,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all transactions',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            ),
            const Expanded(
              flex: 2,
              child: Transactions(),
            )
          ],
        ),
        floatingActionButton: ExpandableFab(
          distance: 60,
          children: [
            ActionButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_rounded),
            ),
            ActionButton(
              onPressed: () {},
              icon: const Icon(Icons.type_specimen_rounded),
            )
          ],
        ),
      )
    );
  }
}
