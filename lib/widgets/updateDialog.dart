import 'dart:io';

import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/images.dart';

import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatelessWidget {

  String message;



  UpdateDialog(this.message);

  _launchURL(String url) async {
    print('print$url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

               Image.asset(Images.update, width: 125, height: 125,),

                Padding(padding: EdgeInsets.all(15)),

                Text("New update available !!", style: TextStyle(fontSize: 20, letterSpacing: 0.8,fontWeight: FontWeight.bold),),

                Padding(padding: EdgeInsets.all(10)),

                Container(
                  margin: EdgeInsets.only(left:20,right: 20),
                    child: Text(message,textAlign: TextAlign.center, style: TextStyle(fontSize: 16, letterSpacing: 0.8,height: 1.5,),)),

                Padding(padding: EdgeInsets.all(25)),

                Platform.isAndroid?   new SizedBox.fromSize(
                  child: new RaisedButton(
                    color: AppColor.primaryBlue,
                    child:Text("Update", style: TextStyle(fontSize: 15,color: AppColor.white,),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    onPressed: (){




                      _launchURL("https://play.google.com/store/apps/details?id=ph.com.ustdi.unitedgoc_reimbursement_mobile");

                    },
                  ),
                  size: Size(150, 40),
                ):Container(),

              ],
            ),
          ),
        )
    );
  }

  void showInfoDialog(context, String message, {required String title, required Function onClose}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.info_outline),
                      new Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: Text(
                            "Information",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.primaryBlue,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed:() => onClose != null
                      ? onClose
                      : () {
                    Navigator.pop(context);
                  }),
            ],
          ),
          content: Text(
            message,
            textScaleFactor: 1,
            style: TextStyle(
              fontSize: 14,
              color: AppColor.primaryBlue,
            ),
          ),
        );
      },
    );
  }





}