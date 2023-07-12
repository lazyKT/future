import 'package:flutter/material.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({ super.key });

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}


class _AddTransactionFormState extends State<AddTransactionForm> {

  final _dateController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionTypeController = TextEditingController();
  final _transactionDetailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build (BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now()
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on_rounded),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Category",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.storage),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Note",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.note_alt_rounded),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
