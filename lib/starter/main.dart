import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hululapp/screens/HomePage.dart';

import 'package:hululapp/screens/login_signin_screen/login_screen.dart';
import 'package:hululapp/screens/login_signin_screen/register_screen.dart';

import '../models/profile_model/Snap.dart';
import '../screens/DrawerScreen.dart';
import '../screens/HomePage2.dart';

var PROFILEIMAGE ;
var NAME;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp();
  runApp(Hulul());
}

class  Hulul extends StatelessWidget {
  //const Hulul({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: HomePage2(),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
      splash: Center(
        child: Container(
          child: Text(
            " حلول",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      duration: 2000,
      nextScreen: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, AsyncSnapshot snapshot) {

          if (snapshot.hasData) {
            PROFILEIMAGE =   NetworkImage(snapshot.data!.photoURL.toString());
            NAME = snapshot.data!.displayName.toString();

            return HomePage2(PROFILEIMAGE,NAME);
          }
          return SignIn();
        },
        //pageTransitionType: PageTransitionType.scale,
      ),
    ));
  }
}
