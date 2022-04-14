import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _moveNextPage(){}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,


drawer: Drawer(),
      //appBar: AppBar(),

      body: Stack(
       // fit: StackFit.loose,
        alignment: Alignment.bottomCenter,

        children: <Widget>[

        SvgPicture.asset( "assets/images/home1.svg",
          alignment: Alignment.center,
          fit: BoxFit.cover,),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,),

         Container(
        //   margin: EdgeInsets.only(top: 30),
           height: 500,
           margin: EdgeInsets.only(bottom: 7),
           child:  InkWell(
             onTap: _moveNextPage,

               child: GridView(

                 children: [

                   // Container(
                   //
                   //   margin: EdgeInsets.only(left: 7),
                   //  decoration: BoxDecoration(
                   //      gradient: LinearGradient(
                   //        colors: [
                   //          Colors.red,
                   //          Colors.red.withOpacity(0.5),
                   //
                   //        ],
                   //      ),
                   //    color: Colors.green,
                   //    borderRadius: BorderRadius.circular(20)
                   //  ),
                   //
                   //   child: Column(
                   //     mainAxisAlignment: MainAxisAlignment.center,
                   //     children: [
                   //     Icon(Icons.report,size: 70,),
                   //     Text("Report",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                   //   ],)
                   // ),
                   //
                   // Container(
                   //   margin: EdgeInsets.only(right: 7),
                   //   decoration: BoxDecoration(
                   //       gradient: LinearGradient(
                   //         colors: [
                   //
                   //           Colors.amberAccent.withOpacity(0.5),
                   //           Colors.amberAccent,
                   //         ],
                   //       ),
                   //       //color: Colors.amberAccent,
                   //       borderRadius: BorderRadius.circular(20)
                   //   ),
                   //
                   //   child:Column(
                   //     mainAxisAlignment: MainAxisAlignment.center,
                   //     children: [
                   //       Icon(Icons.miscellaneous_services_sharp,size: 70,),
                   //       Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                   //     ],)// Icon(Icons.miscellaneous_services_sharp,size: 70,)
                   // ),
                   //
                   // Container(
                   //   margin: EdgeInsets.only(left: 7),
                   //   decoration: BoxDecoration(
                   //       gradient: LinearGradient(
                   //         colors: [
                   //           Colors.teal,
                   //           Colors.teal.withOpacity(0.5),
                   //
                   //         ],
                   //       ),
                   //       // color: Colors.teal,
                   //       borderRadius: BorderRadius.circular(20)
                   //   ),
                   //
                   //   child: Column(
                   //     mainAxisAlignment: MainAxisAlignment.center,
                   //     children: [
                   //       Icon(Icons.comment_outlined,size: 70,),
                   //       Text("Community",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                   //     ],)//Icon(Icons.comment_outlined,size: 70,),
                   // ),
                   //
                   // Container(
                   //   margin: EdgeInsets.only(right: 7),
                   //   decoration: BoxDecoration(
                   //       gradient: LinearGradient(
                   //         colors: [
                   //
                   //           Colors.brown.withOpacity(0.5),
                   //           Colors.brown,
                   //         ],
                   //       ),
                   //       // color: Colors.brown,
                   //       borderRadius: BorderRadius.circular(20)
                   //   ),
                   //
                   //   child: Column(
                   //     mainAxisAlignment: MainAxisAlignment.center,
                   //     children: [
                   //       Icon(Icons.account_balance_wallet_outlined,size: 70,),
                   //       Text("About us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                   //     ],)//Icon(Icons.account_balance_wallet_outlined ,size: 70,),
                   // ),


                   Container(
                     margin: EdgeInsets.only(left: 4),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Stack(
                         children: [
                           Image.asset(
                             "assets/images/report-image.jpg",
                             fit: BoxFit.cover,
                             height: 250,
                             width: double.infinity,
                           ),

                          Positioned(child: Container(
                            height: 70,
                           width: double.infinity,
                            color: Colors.black45,
                            alignment: Alignment.center,
                            child: Text(

                              "Report",
                              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                            ),

                          ),
                            bottom: 0,
                          )

                         ],
                       )
                     ),
                   ),


                   Container(
                     margin: EdgeInsets.only(right: 4),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Stack(
                         children: [
                           Image.asset(
                             "assets/images/services1.jpg",
                             fit: BoxFit.cover,
                             height: 250,
                             width: double.infinity,
                           ),

                         Positioned(child: Container(
                           height: 70,
                          width: double.infinity,
                           color: Colors.black45,
                           alignment: Alignment.center,
                           child: Text(

                             "Services",
                             style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                           ),
                         ),
                         bottom: 0,)

                         ],
                       )
                     ),
                   ),

                   Container(
                     margin: EdgeInsets.only(left: 4),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Stack(
                         children: [
                           Image.asset(
                             "assets/images/community.jpg",
                             fit: BoxFit.cover,
                             height: 250,
                             width: double.infinity,
                           ),

                          Positioned(child: Container(
                            height: 70,
                            width: double.infinity,
                            color: Colors.black45,
                            alignment: Alignment.center,
                            child: Text(

                              "Community",
                              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                          bottom: 0,)

                         ],
                       )
                     ),
                   ),

                   Container(
                     margin: EdgeInsets.only(right: 4),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Stack(
                         children: [
                           Image.asset(
                             "assets/images/about.jpg",
                             fit: BoxFit.cover,
                             height: 250,
                             width: double.infinity,
                           ),

                         Positioned(child: Container(
                           height: 70,
                           width: double.infinity,
                           color: Colors.black45,
                           alignment: Alignment.center,
                           child: Text(
                             "About us",
                             style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                           ),
                         ),
                         bottom: 0,)

                         ],
                       ),
                     ),
                   ),



                 ],

                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

                   childAspectRatio: 3.5 / 4,
                   crossAxisSpacing: 20,
                   mainAxisSpacing: 10,
                   maxCrossAxisExtent: 200,

                 ),
               )
           ),
         )
        ],

        ),
      );


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
