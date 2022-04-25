import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({Key? key}) : super(key: key);
  var PROFILEIMAGE;
  var NAME ;
  ProfileScreen(this.PROFILEIMAGE,this.NAME);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("COMMUNITY"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: widget.PROFILEIMAGE,
                    radius: 90,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(widget.NAME),
                  SizedBox(
                    height: 10,
                  ),
                  Text("ID"),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      logOut();
                    },
                    child: Container(
                      child: Center(child: Text("Log Out")),
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  )
                ],
              ),
           
          ),
    );
  }

  void logOut() {
    FirebaseAuth.instance.signOut().then((value) => Navigator.pop(context));
  }
}
