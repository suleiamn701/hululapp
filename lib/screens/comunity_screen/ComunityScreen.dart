import 'dart:isolate';

import 'package:flutter/material.dart';
import '../../widgets/comunity_widget/Post.dart';

class ComunityScreen extends StatefulWidget {
  const ComunityScreen({Key? key}) : super(key: key);

  @override
  State<ComunityScreen> createState() => _ComunityScreenState();
}

class _ComunityScreenState extends State<ComunityScreen> {
  // var xOffset = 0.0;
  // var yOffset = 0.0;
  // var scaleFactor = 1.0;
  // var isOpen = false;
  // var screenRadius = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("COMMUNITY"),
          backgroundColor:  Colors.brown,
        ),
        body: Container(
          child: ListView(
            children: [
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
            ],
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backg.png"),
                fit: BoxFit.cover),
          ),

          // ChatInputField()
        ));
  }
}
// AnimatedContainer(
//   transform: Matrix4.translationValues(xOffset, yOffset, 0)
//     ..scale(scaleFactor),
//   duration: Duration(milliseconds: 230),
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(screenRadius)),
//       color: Colors.white),
//   // color: Colors.white,
//   child: Column(
//     children: [
//       SizedBox(
//         height: 65,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   if (isOpen == false) {
//                     xOffset = 250;
//                     yOffset = 160;
//                     scaleFactor = 0.8;
//                     screenRadius = 50;
//                     isOpen = true;
//                   } else {
//                     xOffset = 0;
//                     yOffset = 0;
//                     scaleFactor = 1;
//                     screenRadius = 0;
//                     isOpen = false;
//                   }
//                 });
//               },
//               icon: Icon(Icons.menu)),
//           Text("COMUNITY"),
//           CircleAvatar()
//         ],
//       ),
