import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class NetworkImageView extends StatelessWidget{
  String image;


  NetworkImageView(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.close, color: Colors.black,size: 30,),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],

      ),


      body: PinchZoom(
        child: Image.network("${image}" ,
          height: double.infinity,
          width: double.infinity,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent ?loadingProgress){
           if (loadingProgress == null) return child;

          return Center(child: CircularProgressIndicator());
          }
          ),
        resetDuration: const Duration(milliseconds: 100),
        maxScale: 2.5,
      ));
  }

}