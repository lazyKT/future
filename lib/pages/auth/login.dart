import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future/pages/app.dart';
import 'package:future/pages/auth/register.dart';
import 'package:future/pages/auth/utils.dart';

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
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.00, right: 25.00, top: 80.00, bottom: 20.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 20,),
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
                                padding: const EdgeInsets.all(5.00),
                                child: TextFormField(
                                  controller: _passwordTextController,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    prefixIcon: const Icon(Icons.password),
                                    filled: true,
                                    fillColor: const Color(0xfff9f9f9),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.00)
                                    ),
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
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                            child: const Text('Login', style: TextStyle(fontSize: 17.00, fontWeight: FontWeight.w600),),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Or, login with...',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.00,
                                  letterSpacing: 1,
                                ),)
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.00),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  // google sign in
                                  child: OutlinedButton(
                                    onPressed: () {
                                      SocialSignIn.signInWithGoogle()
                                        .then((credentials) {
                                          print('googleSignInResult::result => $credentials');
                                          if (credentials.user != null) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => const App())
                                            );
                                          }
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.00)
                                      )
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                      child: Image(
                                          width: 50,
                                          height: 30,
                                          image: AssetImage('lib/assets/google_logo.png')
                                      )
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
                                          borderRadius: BorderRadius.circular(10.00)
                                      )
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                      child: Image(
                                        width: 50,
                                        height: 30,
                                        image: AssetImage('lib/assets/facebook_logo.png',)
                                      )
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
                                        borderRadius: BorderRadius.circular(10.00)
                                      )
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10.00, horizontal: 20.00),
                                      child: Icon(Icons.apple, size: 35, color: Colors.black,),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'New to the App?',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.00
                                )
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const Register() )
                                );
                              },
                              child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
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
          ),
        ),
      ),
    );
  }
}
