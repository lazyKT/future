import 'package:flutter/material.dart';

class TransactionCategoryIcon extends StatelessWidget {
  final String transactionCategory;

  const TransactionCategoryIcon({
    super.key,
    required this.transactionCategory
  });

  @override
  Widget build(BuildContext context) {
    return categoryIcon();
  }

  Icon categoryIcon() {
    switch(transactionCategory.toLowerCase()) {
      case 'food':
        return const Icon(Icons.fastfood, color: Colors.amberAccent,);
      case 'household':
        return const Icon(Icons.other_houses_rounded, color: Colors.deepPurpleAccent,);
      case 'pet':
        return const Icon(Icons.pets, color: Colors.deepOrange);
      default:
        return const Icon(Icons.account_balance_wallet_rounded, color: Colors.blue,);
    }
  }
}
