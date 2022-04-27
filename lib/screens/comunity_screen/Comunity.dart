import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hululapp/screens/comunity_screen/commons/const.dart';
import 'package:hululapp/screens/comunity_screen/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'commons/utils.dart';
import 'controllers/FBCloudMessaging.dart';
import 'threadMain.dart';



  class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{

  late TabController _tabController;
  late MyProfileData myData;

  bool _isLoading = false;

  @override
  void initState() {
    FBCloudMessaging.instance.takeFCMTokenWhenAppLaunch();
    FBCloudMessaging.instance.initLocalNotification();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    _takeMyData();
    super.initState();
  }

  Future<void> _takeMyData() async{
    setState(() {
      _isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myThumbnail;
    String myName;
    if (prefs.get('myThumbnail') == null) {
      String tempThumbnail = iconImageList[Random().nextInt(50)];
      prefs.setString('myThumbnail',tempThumbnail);
      myThumbnail = tempThumbnail;
    }else{
      myThumbnail = prefs.get('myThumbnail');
    }

    if (prefs.get('myName') == null) {
      String tempName = Utils.getRandomString(8);
      prefs.setString('myName',tempName);
      myName = tempName;
    }else{
      myName = prefs.get('myName');
    }

    setState(() {
      myData = MyProfileData(
          myThumbnail: myThumbnail,
          myName: myName,
          myLikeList: prefs.getStringList('likeList'),
          myLikeCommnetList: prefs.getStringList('likeCommnetList'),
          myFCMToken: prefs.getString('FCMToken'),
      );
    });

    setState(() {
      _isLoading = false;
    });
  }

  void _handleTabSelection() => setState(() {});

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  void updateMyData(MyProfileData newMyData) {
    setState(() {
      myData = newMyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Thread example'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          TabBarView(
            controller: _tabController,
            children: [
              ThreadMain(myData: myData,updateMyData: updateMyData,),
              UserProfile(myData: myData,updateMyData: updateMyData,),
            ]
          ),
          Utils.loadingCircle(_isLoading),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(Icons.people),
            label:  'Thred',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
