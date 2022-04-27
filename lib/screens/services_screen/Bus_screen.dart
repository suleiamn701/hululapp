import 'package:flutter/material.dart';
import '../../widgets/services_widget/bus.dart';




class Buses extends StatelessWidget {
  const Buses(String title,String id, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          titleTextStyle: TextStyle(),
          title: Text("BUS TRACKER"),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        body: Stack(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage("assets/images/backg.png"),
              //               fit: BoxFit.cover),
              //         ),
              //           margin: EdgeInsets.only(top: 30),
            ),
            SingleChildScrollView(

              child:     Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                  bus(),
                ],
              ),
            )

          ],
        ),
      );

  }
}
