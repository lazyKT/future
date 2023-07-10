import 'package:flutter/material.dart';

class BudgetChart extends StatelessWidget {

  const BudgetChart({ super.key });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 20.00),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.redAccent,
        child: const Text('Budget Chart'),
      ),
    );
  }
}
