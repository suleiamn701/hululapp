




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebasePlat{



  Future<void> uploadPlat( String plat)async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('Plats')
        .doc(auth.currentUser?.uid)
        .set({
      'platNumber': plat,


    });

  }
}