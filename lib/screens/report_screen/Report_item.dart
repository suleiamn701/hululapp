import 'package:flutter/material.dart';
import 'report.dart';

class Report_item extends StatelessWidget {
  final String id;
  final String title;

  final AssetImage image;
  const Report_item(this.id, this.title, this.image);
  void navigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Report(title,id)));
  }

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        child: Container(
          height: 150,
          margin: EdgeInsets.only(left: 4),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image(

                    fit: BoxFit.cover,
                    height: 180, image: image,
                    // width: double.infinity,
                  ),
                  Positioned(
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$title",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:15,
                              fontWeight: FontWeight.bold,
                          ),textAlign: TextAlign.center,
                        ),
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
        onTap: () => navigate(context),
      );
    //   InkWell(
    //   onTap: () => navigate(context),
    //   borderRadius: BorderRadius.circular(20),
    //   child: Container(
    //
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //             image:image,
    //             fit: BoxFit.cover),
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //     child: Text(title,style:TextStyle(
    //
    //       fontSize: 20,
    //       color: Colors.brown,
    //       fontWeight: FontWeight.bold,
    //
    //
    //
    //
    //     ),),
    //
    //   ),
    // );
  }
}
