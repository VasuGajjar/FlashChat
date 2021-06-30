import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/components/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    signedInUser();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    colorAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {
        colorAnimation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 55,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF363E4B),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ColoredButton(
              'Login',
              tag: 'login',
              color: Colors.lightBlueAccent,
              onPress: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ColoredButton(
              'Register',
              tag: 'register',
              color: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  signedInUser() async {
    await Firebase.initializeApp();

    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) Navigator.pushReplacementNamed(context, '/chat');
  }
}
