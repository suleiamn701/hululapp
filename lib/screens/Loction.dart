import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Loction extends StatefulWidget {
  const Loction({Key? key}) : super(key: key);

  @override
  _LoctionState createState() => _LoctionState();
}

class _LoctionState extends State<Loction> {

  CameraPosition? _kGooglePlex;
  Position? position;
  double lat=0;
  double long=0;

  @override
  void initState() {
    getpre();
    getlocation();
  }


  Future<void> getpre() async{
    await Geolocator.checkPermission();

    await Geolocator.requestPermission();

  }
  Future<void> getlocation() async{
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    lat = position!.latitude;
    long = position!.longitude;

    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 16,
    );
    setState(() {
      mymarker.add(Marker(markerId: MarkerId('1'),position: LatLng(lat, long)));
    });
  }

  Set<Marker> mymarker ={
    //Marker( markerId: MarkerId('1'), position:l!),
  };

  GoogleMapController? gmc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
        appBar: AppBar(

          backgroundColor:  Colors.brown,
          title: Text('google map'),
        ),
        body:
        SafeArea(

            child:
            Center(

              child:Stack(
                children: [
                  _kGooglePlex == null ? CircularProgressIndicator():
                  Container(
                    // width: double.infinity,
                    // height: double.infinity,
                    child:  GoogleMap(

                      markers: mymarker,

                      onTap: (latlon){
                        mymarker.remove(Marker(markerId: MarkerId('1')));
                        mymarker.add(Marker(markerId: MarkerId('1'),position: latlon));
                        setState(() {

                        });
                      },
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex!,
                      onMapCreated: (GoogleMapController controller) {
                        gmc = controller;
                      },
                    ),
                  ),

                  Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var lat_long = '${lat}, ${long}';
                            Navigator.pop(context, lat_long);
                              },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text('Confirm loction '),
                        ),
                      ],
                    ),
                  )

                ],
              )
              //  mainAxisAlignment: MainAxisAlignment.center,



                  // SizedBox(
                  //   height: 15,
                  // ),




              ),
            )








    );
  }
}
