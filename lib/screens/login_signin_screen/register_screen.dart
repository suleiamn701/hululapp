import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';

class Register extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
              // ##############  Register container   ##############

              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),

              // ##############  First name Textfiled   ##############

              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: username,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white60,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 3)),
                      labelText: ' Username',
                      labelStyle: TextStyle(
                        color: Colors.white60,
                      )),
                ),
              ),

              // ##############  last name Textfiled   ##############

              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: fullname,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white60,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 3)),
                      labelText: ' full Name',
                      labelStyle: TextStyle(
                        color: Colors.white60,
                      )),
                ),
              ),

              // ##############  Email Address Textfiled   ##############

              Container(
                padding: const EdgeInsets.all(15),
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
                      labelText: ' Email Address',
                      labelStyle: TextStyle(
                        color: Colors.white60,
                      )),
                ),
              ),

              // ##############  Password Textfiled   ##############

              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white60,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 3)),
                      labelText: ' Password',
                      labelStyle: TextStyle(
                        color: Colors.white60,
                      )),
                ),
              ),

              // ############## Register Button  ##############

              Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('Register'),
                    onPressed: () async {
                      try {
                        var authresults = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email.text.trim(),
                                password: password.text.trim());
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(authresults.user?.uid)
                            .set({
                          'username': username.text.trim(),
                          'fullname': fullname.text.trim(),
                          'email': email.text.trim(),
                        }).then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn())));
                      } on PlatformException catch (err) {
                        var message =
                            'An error occurred, Please check your credentionals';
                        if (err.message != null) {
                          message = err.message!;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            message,
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
                      } catch (err) {
                        print(err);
                      }
                    },
                  )),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
