import 'package:flutter/material.dart';

 Widget _formContainers(String? text, TextEditingController controller){
 String? s = text;
  return  Container(
    padding: const EdgeInsets.all(15),
    child:
    TextField(

      controller: controller,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(

          prefixIcon: Icon(Icons.person,color: Colors.white60,),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.white60,width: 3)),

          labelText: s,
          labelStyle: TextStyle(
            color:  Colors.white60,
          )

      ),

    ),
  )

}