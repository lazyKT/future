import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:future/bindings/budget_binding.dart';
import 'package:future/dto/budgetTransaction.dart';
import 'package:future/screens/components/transactions/add_transaction_form_field.dart';
import 'package:future/state/budget_state.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

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
          AddTransactionFormField(
            title: 'Date',
            controller: _dateController,
            icon: const Icon(Icons.calendar_today),
            readOnly: true,
            onTap: () async {
              await handleDatePickerOnChange(context);
            },
          ),
          AddTransactionFormField(
            title: 'Amount',
            icon: const Icon(Icons.attach_money_rounded),
            readOnly: false,
            controller: _amountController,
          ),
          AddTransactionFormField(
            title: 'Category',
            icon: const Icon(Icons.category_rounded),
            controller: _transactionTypeController,
            readOnly: false,
          ),
          AddTransactionFormField(
            title: 'Note',
            icon: const Icon(Icons.note_alt_rounded),
            controller: _transactionDetailsController,
            readOnly: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      addTransaction(context);
                    },
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Scan receipt'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> handleDatePickerOnChange (BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now()
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  void addTransaction (BuildContext context) {
    BudgetTransaction transaction = BudgetTransaction(
      transactionType: _transactionTypeController.text,
      transactionDetails: _transactionDetailsController.text,
      transactionAmount: double.parse(_amountController.text),
      transactionBudgetId: const Uuid().v4(),
      transactionTime: DateTime.parse(_dateController.text)
    );
    BudgetState state = BudgetTransactionBinding.of(context).state;
    state.addTransactions(transaction);
    Navigator.of(context).pop();
  }
}
