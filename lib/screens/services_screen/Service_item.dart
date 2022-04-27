import 'package:flutter/material.dart';
import 'package:hululapp/screens/services_screen/qr_screen.dart';
import 'Bus_screen.dart';
import 'service.dart';

class Service_item extends StatelessWidget {
  final String id;
  final String title;

  final AssetImage image;
  const Service_item(this.id, this.title, this.image);
  void navigate(context,String id) {
    if(id == 's2'){
    Navigator.push(context, MaterialPageRoute(builder: (context) => QR(title,id)));
  }
    else if(id =='s3'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Buses(title,id)));
    }


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
                      height: 50,
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
        onTap: () => navigate(context,id),
      );
  }}
