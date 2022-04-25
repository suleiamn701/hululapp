import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget {
  // const AboutUs({Key? key}) : super(key: key);
  String internalText =
      " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ABOUT US"),
        backgroundColor:  Colors.brown,
      ),
      body: Container(

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
                child: Text(internalText,style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              color: Colors.white30,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),


            ),
          ],
        ),
      ),
    );
  }
}
