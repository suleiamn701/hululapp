import 'package:flutter/material.dart';
class ContactUs extends StatelessWidget {
  // const AboutUs({Key? key}) : super(key: key);
 var internalText = "You can email us on SQUBURGER@squ.edu.om\n\n OR \n\n Call us on\n 9999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CONTACT US"),
        backgroundColor:  Colors.brown,
      ),
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(internalText,style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
              ),
              color: Colors.white30,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),


            ),
          ],
        ),
      ),
    );
  }
}
