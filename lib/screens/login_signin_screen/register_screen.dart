import 'package:flutter/material.dart';

class Register  extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
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
                style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
              )),

          // ##############  First name Textfiled   ##############

          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(

              controller: fname,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(

                prefixIcon: Icon(Icons.person,color: Colors.white60,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.white60,width: 3)),

                labelText: ' First Name',
                  labelStyle: TextStyle(
                    color:  Colors.white60,
                  )

              ),

            ),
          ),

          // ##############  last name Textfiled   ##############

          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(

              controller: lname,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(

                prefixIcon: Icon(Icons.person,color: Colors.white60,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.white60,width: 3)),

                labelText: ' Last Name',

                  labelStyle: TextStyle(
                    color:  Colors.white60,
                  )

              ),

            ),
          ),

          // ##############  Email Address Textfiled   ##############

          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(

              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(

                prefixIcon: Icon(Icons.email,color: Colors.white60,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.white60,width: 3)),

                labelText: ' Email Address',
                  labelStyle: TextStyle(
                    color:  Colors.white60,
                  )

              ),

            ),
          ),

          // ##############  Password Textfiled   ##############

          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(

              controller: email,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(

                prefixIcon: Icon(Icons.lock,color: Colors.white60,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.white60,width: 3)),

                labelText: ' Password',
                  labelStyle: TextStyle(
                    color:  Colors.white60,
                  )

              ),

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
                onPressed: () {

                },
              )
          )

        ],
      ),

),


),
    );
  }
}
