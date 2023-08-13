import 'package:flutter/material.dart';

class AddTransactionFormField extends StatelessWidget {

  final String title;
  final TextEditingController controller;
  final Widget icon;
  final bool readOnly;
  final VoidCallback? onTap;

  const AddTransactionFormField({
    super.key,
    required this.title,
    required this.controller,
    required this.icon,
    required this.readOnly,
    this.onTap
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              keyboardType: title == 'Amount' ? TextInputType.number : TextInputType.text,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: icon,
              ),
              readOnly: readOnly,
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
