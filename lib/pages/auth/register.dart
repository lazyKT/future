import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  const Register({ super.key });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.00, right: 25.00, top: 80.00, bottom: 20.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register'
            )
          ],
        ),
      ),
    );
  }
}
