import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';

class NetworkDialog extends StatelessWidget {

  void checkState(BuildContext context) {
    (Connectivity().checkConnectivity()).then((result){
      if (result != ConnectivityResult.none) {
        Navigator.pop(context);
      }
    });
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

                Icon(Icons.network_locked),


                Padding(padding: EdgeInsets.all(15)),

                Text("No Network Connection", style: TextStyle(fontSize: 20, letterSpacing: 0.8),),

                Padding(padding: EdgeInsets.all(25)),

                new SizedBox.fromSize(
                  child: new RaisedButton(
                      color: AppColor.primaryBlue,
                      child:Text("Retry", style: TextStyle(fontSize: 15,color: AppColor.white),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: (){
                        checkState(context);
                      }
                  ),
                  size: Size(150, 40),
                ),

              ],
            ),
          ),
        )
    );
  }
}
