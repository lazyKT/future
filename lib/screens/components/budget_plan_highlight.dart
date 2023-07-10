import 'package:flutter/material.dart';

import 'budget_card_s.dart';

class BudgetHighlight extends StatefulWidget {
  const BudgetHighlight({ super.key });

  @override
  State<BudgetHighlight> createState() => _BudgetHighlightState();
}

class _BudgetHighlightState extends State<BudgetHighlight> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                '\$240',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25.00,
                  fontFamily: 'mono-space'
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Spent this week',
                style: TextStyle(
                  fontSize: 16.00,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'RobotoMono'
                ),
              )
            ],
          ),
        ),
        // budget plan target and balance
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: BudgetCardS(
                      title: 'Balance',
                      amount: 600,
                      icon: Icon(Icons.account_balance_wallet_rounded)
                  )
              ),
              SizedBox(width: 10,),
              Expanded(
                  flex: 1,
                  child: BudgetCardS(
                      title: 'Target',
                      amount: 300,
                      icon: Icon(Icons.account_balance_wallet_rounded)
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}

