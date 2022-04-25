import 'package:flutter/material.dart';
import 'package:hululapp/screens/report_screen/report_type.dart';
import 'report_type.dart';
import 'Report_item.dart';
import 'Report_item.dart';

class Report_screen extends StatelessWidget {
  const Report_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Report"),
        backgroundColor: Colors.brown,
      ),
      body: Container(

        decoration: const BoxDecoration(

          image: DecorationImage(
              image:AssetImage("assets/images/backg.png"), fit: BoxFit.cover),
        ),

        child: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: Report_type
            .map(
              (catData) => Report_item(
              catData.id,
              catData.title,

              catData.image

          ),
        )
            .toList(),
      ),)
    );
  }
}
