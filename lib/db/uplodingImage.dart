
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
class FirebaseUplodingImage{
  //final FirebaseStorage storge =FirebaseStorage.instance;


  Future<void> uploadimage(File file) async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final imageName = basename(file.path);
    final storageRef = FirebaseStorage.instance.ref().child('images/$imageName');

    storageRef.putFile(file).then((snap) =>{
        if(snap.state == TaskState.success){
          storageRef.getDownloadURL().then((url) =>
          {
            print(url)
          })
        }
    }
    );

    final fileURL = await storageRef.getDownloadURL().then((value) =>
        print('url of image')
        // FirebaseFirestore.instance
        //     .collection('images')
        //     .doc(auth.currentUser?.uid)
        //     .set({
        //   'image': fileURL,

        );





    try{
    //  await storge.ref('images/$filename').putFile(file).then((p0) => print('done'));
  }on core.FirebaseException catch(e){
      print(e);
    }
}


}