import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileImageView extends StatelessWidget{
  File? image;


  FileImageView(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(icon: Icon(Icons.close, color: Colors.white,size: 30,),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],

        ),


        body: Image.file(image! ,
          height: double.infinity,
          width: double.infinity,
        ));
  }

}