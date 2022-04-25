import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  // const Post({Key? key}) : super(key: key);
  String internalText =
      " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  Post();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [Text("comunity"), Text("user")],
                ),
                SizedBox(
                  width: 10,
                ),
                Text("type of user")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [Text(internalText)],
            )
          ],
        ),
      ),
    );
  }
}
