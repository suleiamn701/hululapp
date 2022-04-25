import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'DrawerScreen.dart';
import 'comunity_screen/ComunityScreen.dart';
import 'login_signin_screen/login_screen.dart';
import 'login_signin_screen/register_screen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  dynamic snapshot;
  HomeScreen(this.snapshot);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _moveNextPage(int npage) {
    if (npage == 1) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => ComunityScreen())); // go to report page
    } else if (npage == 2) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => Register())); // go to sercies page
    } else if (npage == 3) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => Register())); // go to community page
    } else {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => Register())); // go to about us page
    }
  }

  var xOffset = 0.0;
  var yOffset = 0.0;
  var scaleFactor = 1.0;
  var isOpen = false;
  var screenRadius = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
          //  DrawerScreen(),
            AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 230),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(screenRadius)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (isOpen == false) {
                                xOffset = 250;
                                yOffset = 160;
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
                      Text("COMUNITY"),
                      CircleAvatar()
                    ],
                  ),
                  // Stack(
                  //   fit: StackFit.loose,
                  //   alignment: Alignment.bottomCenter,
                  //   children: <Widget>[
                  //     SvgPicture.asset(
                  //       "assets/images/home1.svg",
                  //       alignment: Alignment.center,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     // width: MediaQuery.of(context).size.width,
                  //     // height: MediaQuery.of(context).size.height,),

                  Container(
                      constraints: BoxConstraints.expand(),
                      // decoration: const BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage("assets/images/backg.png"),
                      //       fit: BoxFit.cover),
                      // ),
                      //   margin: EdgeInsets.only(top: 30),

                      margin: EdgeInsets.only(bottom: 7),
                      child: Column(
                        children: [
                          Row(children: [
                            InkWell(
                              onTap: _moveNextPage(
                                  1), // 1 means go to report page

                              child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/report-image.jpg",
                                          fit: BoxFit.cover,
                                          height: 250,
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
                                                  fontWeight:
                                                  FontWeight.bold),
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
                            InkWell(
                              onTap: _moveNextPage(
                                  2), // 2 means go to servies page
                              child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/services1.jpg",
                                          fit: BoxFit.cover,
                                          height: 250,
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
                                                  fontWeight:
                                                  FontWeight.bold),
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
                          Row(
                            children: [
                              InkWell(
                                onTap: _moveNextPage(
                                    3), // 3 means go to community page
                                child: Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            "assets/images/community.jpg",
                                            fit: BoxFit.cover,
                                            height: 250,
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
                                                    fontWeight:
                                                    FontWeight.bold),
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
                              InkWell(
                                onTap: _moveNextPage(
                                    4), // 4 means go to about us page
                                child: Container(
                                  margin: EdgeInsets.only(right: 4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/about.jpg",
                                          fit: BoxFit.cover,
                                          height: 250,
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
                                                  fontWeight:
                                                  FontWeight.bold),
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
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
                  ),

            )
          ],
        ));
  }
}

/*
    ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),


                  gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
          ),
*
* */
