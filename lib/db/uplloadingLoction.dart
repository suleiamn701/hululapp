


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoaction{



  Future<void> uploadLoction( String lat,String long)async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('location')
        .doc(auth.currentUser?.uid)
        .set({
      'lantitude': lat,
      'longitude': long,

    });

  }
}