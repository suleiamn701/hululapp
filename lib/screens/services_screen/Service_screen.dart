import 'package:flutter/material.dart';
import 'package:hululapp/screens/report_screen/report_type.dart';
import 'service_type.dart';
import 'Service_item.dart';
import 'Service_item.dart';

class Service_screen extends StatelessWidget {
  const Service_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Services"),
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
        children: Service_type
            .map(
              (catData) => Service_item(
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
