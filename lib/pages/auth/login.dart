import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  const Login({ super.key });

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.00, right: 25.00, top: 80.00, bottom: 20.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: Center(
                child: Image(
                  image: AssetImage('lib/assets/login.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 26.00,
                fontWeight: FontWeight.bold
              ),
            ),
            // Form
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.00),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.alternate_email)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.00),
                          child: TextFormField(
                            controller: _passwordTextController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.password)
                            ),
                            obscureText: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Forget password?', style: TextStyle(fontSize: 15.00),),
                        onPressed: () {
                          //
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.00),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(10.00),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.00)
                        )
                      ),
                      onPressed: () {

                      },
                      child: const Text('Login', style: TextStyle(fontSize: 15.00),),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black38,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.00),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black45,
                        padding: const EdgeInsets.all(10.00),
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xffdaf0f7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.00)
                        )
                      ),
                      onPressed: () {

                      },
                      child: const Text(
                        'Login in with Google',
                        style: TextStyle(fontSize: 15.00, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New to the App?', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500)),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
