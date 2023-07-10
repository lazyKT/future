import 'package:flutter/material.dart';
import 'package:future/screens/components/budget_chart.dart';
import 'package:future/screens/components/budget_plan_highlight.dart';
import 'package:future/screens/components/transactions.dart';

class Home extends StatefulWidget {

  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
            const Expanded(
              flex: 3,
              child: BudgetChart(),
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
