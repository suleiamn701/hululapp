import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  //const SignIn({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
                    style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                  )),

              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(

                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(

                    prefixIcon: Icon(Icons.email,color: Colors.white60,),
                    border: OutlineInputBorder(),

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
                    prefixIcon: Icon(Icons.lock,color: Colors.white60,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60)
                    ),

                    labelText: 'Your Password',


                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password',),
              ),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      print(email.text);
                      print(password.text);
                    },
                  )
              )
            ],
          ),


      ),

      )
      ,
    );
  }
}
