import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hululapp/screens/HomePage.dart';


import 'package:hululapp/screens/login_signin_screen/login_screen.dart';
import 'package:hululapp/screens/login_signin_screen/register_screen.dart';

void main() => runApp(const Hulul());

class Hulul extends StatelessWidget {
  const Hulul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            child: Text(
              " حلول",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ),
        ),
        duration: 2000,
        nextScreen: /*SignIn(),*/ HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        //pageTransitionType: PageTransitionType.scale,
      ),
    );
  }
}
