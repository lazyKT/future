import 'package:flutter/material.dart';
import 'package:future/screens/components/budget_chart.dart';
import 'package:future/screens/components/budget_plan_highlight.dart';
import 'package:future/screens/components/transactions.dart';

import '../dto/budgetTransaction.dart';

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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // current spending
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.black12,
            ),
            const Expanded(
              flex: 2,
              child: BudgetHighlight(),
            ),
            Expanded(
              flex: 3,
              child: BudgetLineChart(transactions),
            ),
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
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Scan',
                      style: TextStyle(
                        fontSize: 17.00,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.00)
                      )
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
