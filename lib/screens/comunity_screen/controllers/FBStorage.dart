import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FBStorage {
  static Future<String> uploadPostImages({required String postID,required File postImageFile}) async {
    try {
      String fileName = 'images/$postID/postImage';
      final reference = FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = reference.putFile(postImageFile);
     // final storageTaskSnapshot = await uploadTask.onComplete;
      String postIageURL = await reference.getDownloadURL();
      return postIageURL;
    }catch(e) {
      return "";
    }
  }
}