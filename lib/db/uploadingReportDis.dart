






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDiscreption{



  Future<void> reportDiscrption( String title,String disc,String issueLoc)async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('reportDiscreption')
        .doc(auth.currentUser?.uid)
        .set({
      'title': title,
      'discreption': disc,
      'issueLocation': issueLoc,

    });

  }
}