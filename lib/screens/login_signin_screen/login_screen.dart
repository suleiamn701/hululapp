import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../HomePage.dart';
import 'register_screen.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //const SignIn({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(

          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backg.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white60,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white60, width: 3)),
                    labelText: ' Your Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    //  enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white60,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white60, width: 3)),

                    labelText: 'Your Password',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text('Login'),
                  onPressed: () {
                    var nothing = null;
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text.trim())
                        .then((value) {
                      AnimatedSplashScreen(
                        splash: Text('waiting...'),
                        duration: 1000,
                        nextScreen:   HomeScreen(nothing),
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => HomeScreen()));,
                      );


                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'invalid email or password, try again!',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                      ));
                    });
                    print(email.text);
                    print(password.text);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: const Text(
                  'Create New Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextButton(

                    onPressed: () async{
                      final newuser = await _googleSignIn.signIn();
                      final googleauth = await newuser!.authentication;
                      final creds = GoogleAuthProvider.credential(
                        accessToken:googleauth.accessToken ,
                        idToken: googleauth.idToken,
                      );

                     var authresults =  await FirebaseAuth.instance.signInWithCredential(creds);

                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(authresults.user?.uid)
                          .set({
                        'username':  authresults.additionalUserInfo?.username.toString().trim(),
                        'fullname':  authresults.user?.displayName.toString().trim(),
                        'email': authresults.user?.email.toString().trim(),
                      }).then((value) =>
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomeScreen(authresults)))
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Image.asset(
                          'assets/images/google2.jpg',
                          height: 37.0,

                        ),
                        SizedBox(width: 7,),
                        new Expanded(

                          child: Text('Sign in with Google', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
