import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hululapp/screens/about_screen/AboutUs.dart';
import 'package:hululapp/screens/comunity_screen/ComunityScreen.dart';
import 'package:hululapp/screens/profile_screen/profileScreen.dart';
import 'package:hululapp/screens/report_screen/report_screen.dart';
import 'package:hululapp/screens/services_screen/Service_screen.dart';

import 'DrawerScreen.dart';
import 'comunity_screen/Comunity.dart';

class HomePage2 extends StatefulWidget {
  // const HomePage2({Key? key}) : super(key: key);
  var PROFILEIMAGE;
  var NAME;
  HomePage2(this.PROFILEIMAGE, this.NAME);
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  var xOffset = 0.0;
  var yOffset = 0.0;
  var scaleFactor = 1.0;
  var isOpen = false;
  var screenRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DrawerScreen(widget.PROFILEIMAGE, widget.NAME),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 230),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(screenRadius)),
            color: Colors.white,//backGround color
            // color: Colors.white,
          ),
          child: Column(
            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                    top: Radius.circular(screenRadius),
                  ),
                  // color: Color.fromRGBO(242, 203, 5, 100)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (isOpen == false) {
                                  xOffset = 250;
                                  yOffset = 100;
                                  scaleFactor = 0.8;
                                  screenRadius = 50;
                                  isOpen = true;
                                } else {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  screenRadius = 0;
                                  isOpen = false;
                                }
                              });
                            },
                            icon: Icon(Icons.menu)),
                        Text("حلول"),
                        InkWell(
                          onTap: () {
                            NavigateToProfileScreen();
                          },
                          child: CircleAvatar(
                            foregroundImage: widget.PROFILEIMAGE,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                // constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backg.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 340,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: 150,
                              margin: EdgeInsets.only(left: 4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/report-image.jpg",
                                        fit: BoxFit.cover,
                                        height: 100,
                                        // width: double.infinity,
                                      ),
                                      Positioned(
                                        child: Container(
                                          height: 70,
                                          width: double.infinity,
                                          color: Colors.black45,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Report",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),

                                        left:
                                            0, //set left 0, to start without margin at left
                                        right: 0,
                                        bottom: 0,
                                      )
                                    ],
                                  )),
                            ),
                            onTap: () {
                              NavigateToReportPage();
                            },
                          ),
                          InkWell(
                            onTap: (){NavigateToServicePage();},
                            child: Container(
                              height: 150,
                              margin: EdgeInsets.only(right: 4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/services1.jpg",
                                        fit: BoxFit.cover,
                                        height: 100,
                                        // width: double.infinity,
                                      ),
                                      Positioned(
                                        child: Container(
                                          height: 70,
                                          width: double.infinity,
                                          color: Colors.black45,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Services",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        left:
                                            0, //set left 0, to start without margin at left
                                        right: 0,
                                        bottom: 0,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(left: 4),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/community.jpg",
                                      fit: BoxFit.cover,
                                      height: 100,
                                      // width: double.infinity,
                                    ),
                                    Positioned(
                                      child: Container(
                                        height: 70,
                                        width: double.infinity,
                                        color: Colors.black45,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Community",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      left:
                                          0, //set left 0, to start without margin at left
                                      right: 0,
                                      bottom: 0,
                                    )
                                  ],
                                )),
                          ),
                          onTap: () {
                            NavigateToCommunityPage();
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(right: 4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/about.jpg",
                                    fit: BoxFit.cover,
                                    height: 100,
                                    // width: double.infinity,
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: 70,
                                      width: double.infinity,
                                      color: Colors.black45,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "About us",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    left:
                                        0, //set left 0, to start without margin at left
                                    right: 0,
                                    bottom: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            NavigateToAboutUsPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )

              // ChatInputField()
            ],
          ),
        ),
      ],
    ));
  }

  void NavigateToReportPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Report_screen()));
  }
  void NavigateToServicePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Service_screen()));
  }
  void NavigateToCommunityPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Community()));
  }

  void NavigateToAboutUsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
  }

  void NavigateToProfileScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProfileScreen(widget.PROFILEIMAGE, widget.NAME)));
  }
}
