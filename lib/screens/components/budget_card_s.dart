import 'package:flutter/material.dart';

class BudgetCardS extends StatelessWidget {

  final String title;
  final double amount;
  final Icon icon;

  const BudgetCardS({
    super.key,
    required this.title,
    required this.amount,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: icon,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.00,
                        color: Colors.black45
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    '\$$amount',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.00,
                        color: Colors.black54
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
