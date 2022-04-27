import 'package:flutter/material.dart';
import 'dart:io';
import '../../db/uplloadingLoction.dart';
import '../../db/uploadingReportDis.dart';
import '../../db/uplodingImage.dart';
import '../Loction.dart';
import '../imagePicker.dart';
import 'package:path/path.dart';
class Report extends StatelessWidget {
  final String report = 'Report';
  var categoryTitle = '';
  var categoryId = '';
  Report(this.categoryTitle, this.categoryId);


  TextEditingController reportTitil = TextEditingController();
  TextEditingController discreption = TextEditingController();
  TextEditingController isueLoction = TextEditingController();
  var imgee;
  var lat;
  var long;
  @override
  Widget build(BuildContext context) {

    void upload() async{
      FirebaseDiscreption firebasedisc = FirebaseDiscreption();
      await firebasedisc.reportDiscrption(reportTitil.text, discreption.text, isueLoction.text);
      FirebaseLoaction firebaseLoction = FirebaseLoaction();
      await firebaseLoction.uploadLoction(lat, long).then((value) => print('done loc'));
      FirebaseUplodingImage firebaseImage = FirebaseUplodingImage() ;
      await firebaseImage.uploadimage(imgee).then((value) =>
      {
        print('done image')

      }
      );

    }

    void addImage()async{
       imgee = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Images()));
      print( basename(imgee.path));
      print(imgee.path);
    }

    void addLocation() async{
      final lat_long = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loction()));
      var ll = lat_long.split(',');
      lat = ll[0];
      long =  ll[1];
      print('lat: ${ll[0]}');
      print('lat: ${ll[1]}');
    }

    // final routArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(

        appBar: AppBar(
            centerTitle: true,
            title: Text(categoryTitle.toString()),
            backgroundColor: Colors.brown),
        body: Stack(

          children: [
            Container(

                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backg.png"),
                      fit: BoxFit.cover),
                ),
                ), SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        width: 20,
                        height: 140,
                      ),
                      TextField(
                        controller: reportTitil,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            // border: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            // enabledBorder: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            // disabledBorder: InputBorder.none,


                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Report Title',
                          fillColor: Colors.white60, filled: true
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextField(
                        controller: discreption,
                        maxLines: 9,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Report Discreption',
                            fillColor: Colors.white60, filled: true
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextField(
                        controller: isueLoction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Issue Location',
                            fillColor: Colors.white60, filled: true
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.green),
                              onPressed: addImage,
                              child: Text("Add images")),
                          SizedBox(
                            width: 27,
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: addLocation,
                              child: Text("Add Location")),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed:(){
                            upload();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Report successfully', style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              action: SnackBarAction(
                                label: 'Dismiss', onPressed: () {}, textColor: Colors.white,),
                            ));
                            Navigator.pop(context, 'done');
                          },
                          child: Text("Report!")),
                    ]),
                  ),
                ),
          ],
        ));
  }
}
