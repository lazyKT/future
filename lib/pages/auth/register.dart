import 'package:flutter/material.dart';
import 'package:future/pages/auth/utils.dart';

class Register extends StatefulWidget {

  const Register({ super.key });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cfmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.00, right: 10.00, top: 70.00, bottom: 10.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new),
                          Text(
                            'back to Login',
                            style: TextStyle(
                                fontSize: 16.00,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      )
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Image(
                        image: AssetImage('lib/assets/login.jpg'),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 15.00),
                    child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25.00, fontWeight: FontWeight.w600)
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Social register
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.00, horizontal: 15.00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  onPressed: () {
                                    SocialSignIn.signInWithGoogle();
                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.00)
                                      )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                    child: Image(
                                      width: 50,
                                      height: 30,
                                      image: AssetImage('lib/assets/google_logo.png',)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.00)
                                      )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                    child: Icon(Icons.account_balance_wallet, size: 35,),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.00)
                                      )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                    child: Icon(Icons.apple, size: 35, color: Colors.black,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Or register with email ...',
                            style: TextStyle(
                                fontSize: 16.00,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54
                            ),
                          ),
                        ),
                        // registration form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 8.00),
                                child: TextFormField(
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    hintText: 'name',
                                    prefixIcon: const Icon(Icons.abc),
                                    filled: true,
                                    fillColor: const Color(0xfff9f9f9),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.00)
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 8.00),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    hintText: 'email',
                                    prefixIcon: const Icon(Icons.alternate_email),
                                    filled: true,
                                    fillColor: const Color(0xfff9f9f9),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.00)
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 8.00),
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    prefixIcon: const Icon(Icons.password),
                                    filled: true,
                                    fillColor: const Color(0xfff9f9f9),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.00)
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 8.00),
                                child: TextFormField(
                                  controller: _cfmPwdController,
                                  decoration: InputDecoration(
                                    hintText: 'confirm password',
                                    prefixIcon: const Icon(Icons.password_sharp),
                                    filled: true,
                                    fillColor: const Color(0xfff9f9f9),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.00)
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 8.00),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(10.00),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.00)
                              ),
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
