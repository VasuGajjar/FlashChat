import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/custom_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool progressState = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: progressState,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                ColoredButton(
                  'Login',
                  tag: 'login',
                  color: Colors.lightBlueAccent,
                  onPress: () {
                    setState(() {
                      progressState = true;
                    });

                    try {
                      authenticateUser();
                    } catch (e) {
                      print(e);
                    }

                    setState(() {
                      progressState = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void authenticateUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/chat');
    }
  }
}
