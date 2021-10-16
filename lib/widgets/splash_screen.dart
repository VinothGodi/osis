import 'dart:async';
import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/login_model.dart';
import 'package:osis/service/shared/preference_service.dart';


import '../locator.dart';
import '../router.dart';

class SplashScreen extends StatefulWidget {
  final Color ?backgroundColor;



  SplashScreen({ this.backgroundColor});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String _versionName = 'V1.0';
  final splashDelay = 5;
   LoginModel ?loginModel;

  @override
  void initState() {
    super.initState();
    loginModel = locator<PreferenceService>().getUserData();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    //sLogin!.isEmpty?Routes.authentication:
    Navigator.pushReplacementNamed(context,loginModel?.accessToken==null?Routes.login:Routes.dashboard);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          new Text("OSIS",textScaleFactor: 1,style: AppTextStyle.appBarTitle.copyWith(color: AppColor.black,fontSize: 28,fontWeight: FontWeight.normal),),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}