import 'package:flutter/material.dart';
import '../starter/main.dart';
import 'about_screen/AboutUs.dart';
import 'about_screen/ContactUs.dart';
import 'profile_screen/profileScreen.dart';
import '';

var p = PROFILEIMAGE;
var n = NAME;
class DrawerScreen extends StatefulWidget {
  //const DrawerScreen({Key? key}) : super(key: key);
  var PROFILEIMAGE;
  var NAME ;
  DrawerScreen(this.PROFILEIMAGE,this.NAME);
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:
          Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[
           Colors.white60,
          Color.fromRGBO(38, 115, 101, 1),//backGround color

          ], // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 65,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                CircleAvatar(
                  foregroundImage: widget.PROFILEIMAGE,
                ),
                SizedBox(height: 15,),
                Text(
                  widget.NAME,
                  style: TextStyle(color: Colors.white),
                ),

              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(height: 80),
                  InkWell(
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 15, bottom: 1, right: 15),
                      child: const Text(
                        "PROFILE",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      NavigateToProfileScreen();
                    },
                  ),
                  Container(
                    height: 2.5,
                    width: 100,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5))),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 15, bottom: 1, right: 15),
                      child: const Text(
                        "SETTING",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  Container(
                    height: 2.5,
                    width: 100,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius:
                        BorderRadius.all(const Radius.circular(5))),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 15, bottom: 1, right: 15),
                      child: const Text(
                        "ABOUT US",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {NavigateToAboutUsPage() ;},
                  ),
                  Container(
                    height: 2.5,
                    width: 100,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 15, bottom: 1, right: 15),
                      child: const Text(
                        "CONTACT US",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {NavigateToContactUsPage();},
                  ),
                  Container(
                    height: 2.5,
                    width: 100,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              )
            ],
          ),
        ],
      ),
    );


  }

  void NavigateToProfileScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(widget.PROFILEIMAGE,widget.NAME)));
  }
  void NavigateToAboutUsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
  }
  void NavigateToContactUsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
  }
}
