import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

import '../db/uplodingImage.dart';


class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {

  File? _image;
  Future pikimaage(ImageSource source) async{
    final image;

    image = await ImagePicker().pickImage(source: source);
    if(image !=null){
      setState(() {
        final imagetemp = File(image.path);
        print('path');
        print(imagetemp);
        this._image = imagetemp;
        Navigator.pop(context, 'Cancel');
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Adding Image'),
      ),
      body: SafeArea(

        child: Center(

          child: Column(
            children: [
              SizedBox(height: 300,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: ()=> showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Add Image'),
                    content: const Text('please take image or upload one!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => pikimaage(ImageSource.camera),
                        child: const Text('Camera'),
                      ),
                      TextButton(

                        onPressed: () => pikimaage(ImageSource.gallery),
                        child: const Text('Gallery'),
                      ),
                    ],
                  ),
                ),
                child: Text('Add image'),

              ),


              _image == null? CircularProgressIndicator() :
              Container(
                child:Image.file(
                  _image!,
                  height: 300,
                  width: 500,
                ) ,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {Navigator.pop(context, _image!);},
                child: Text('Accept'),

              ),


            ],
          ),

        ),

      ),

    );
  }
}
