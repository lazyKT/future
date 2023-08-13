
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future/dto/user.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';


class Web3AuthLoginPage extends StatefulWidget {
  
  Web3AuthLoginPage({ super.key });
  
  @override
  State<Web3AuthLoginPage> createState() => _Web3AuthLoginState();
}


class _Web3AuthLoginState extends State<Web3AuthLoginPage> {

  bool isLoginSuccess = false;
  User? user;
  
  @override
  void initState () {
    super.initState();
    initWeb3Auth();
  }
  
  void initWeb3Auth() async {
    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('future://com.example.future/auth');
    }
    else if (Platform.isIOS) {
      redirectUrl = Uri.parse('com.example.future://openlogin');
    }
    else {
      throw UnKnownException("Unknown platform");
    }
    await Web3AuthFlutter.init(Web3AuthOptions(
        clientId: 'BKQ48a54NBQgUqj7K4jzehvCqRx5Fas2iX4EIfpgpgvASwegdzyU-oo040SIK75EKkLUT-scQb6EOR1pAhIEdbM',
        network: Network.cyan,
        redirectUrl: redirectUrl
    ));
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLoginSuccess && user != null)
                ...[
                  const Text("Login Success!"),
                  Row(
                    children: [
                      const Text("Email: "),
                      Text(user!.userEmail)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: _logout(),
                    child: const Text('Log out'),
                  )
                ]
              else
                ...[
                  ElevatedButton(
                    onPressed: _login(_withGoogle),
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _login(_withFacebook),
                    child: const Text('Sign in with Facebook'),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _login(_withEmailPasswordless),
                    child: const Text('Sign in with Email'),
                  ),
                ]
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback _login(Future<Web3AuthResponse> Function() method) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        print('response $response');

        setState(() {
          isLoginSuccess = true;
          user = User.fromWeb3AuthResponse(response.toJson()['userInfo']);
        });
      } on UserCancelledException {
        print("User cancelled.");
        setState(() {
          isLoginSuccess = false;
          user = null;
        });
      } on UnKnownException {
        print("Unknown exception occurred");
        setState(() {
          isLoginSuccess = false;
          user = null;
        });
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
      mfaLevel: MFALevel.DEFAULT,
    ));
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.facebook));
  }

  Future<Web3AuthResponse> _withEmailPasswordless() {
    return Web3AuthFlutter.login(LoginParams(
        loginProvider: Provider.email_passwordless,
        extraLoginOptions:
        ExtraLoginOptions(login_hint: "hello+flutterdemo@tor.us")));
  }

  VoidCallback _logout() {
    return () async {
      try {
        print('logout');
        setState(() {
          isLoginSuccess = false;
          user = null;
        });
        await Web3AuthFlutter.logout();
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }
}

