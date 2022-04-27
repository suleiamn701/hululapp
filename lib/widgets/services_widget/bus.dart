import 'dart:math';

import 'package:flutter/material.dart';

class bus extends StatelessWidget {
  // const bus({Key? key}) : super(key: key);
  var busId = 1000 + Random().nextInt(5999);
  var spot = Random().nextInt(15);
  var min = Random().nextInt(70);
  var txtStyle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "BusNumber  $busId",
                  style: txtStyle,
                ),
                Text(
                  "Next Stop in spot $spot",
                  style: txtStyle,
                ),
                Text(
                  "Will arrive after $min minuts",
                  style: txtStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
