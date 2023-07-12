import 'package:flutter/material.dart';

import 'components/transactions/add_transaction_form.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({ super.key });

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('back'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: AddTransactionForm(),
            )
          ],
        ),
      )
    );
  }
}