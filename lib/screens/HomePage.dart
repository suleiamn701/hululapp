import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Widget svg = SvgPicture.asset(
      "assets/images/home.svg",

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,




      body: Stack(
        children: <Widget>[
        SvgPicture.asset( "assets/images/home.svg",
          alignment: Alignment.center,
          fit: BoxFit.cover,)
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,),


        ],

        ),
      );


  }
}
