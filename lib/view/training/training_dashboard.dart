import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';

import 'package:osis/view/training/training_view_model.dart';
import 'package:osis/widgets/base_view.dart';

import '../../router.dart';

class TrainingDashboard extends StatefulWidget{
  @override
  _TrainingDashboardState createState() => _TrainingDashboardState();
}

class _TrainingDashboardState extends State<TrainingDashboard> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<TrainingViewModel>(
        onModelReady: (viewModel) async {

        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("Training",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){

                   Navigator.pushNamed(context, Routes.trainingWSQ);

                  },
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:new Text("WSQ",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10)),
                ),
                GestureDetector(
                    onTap: (){
                      print("sdsd");

                     Navigator.pushNamed(context, Routes.trainingDevelopmental);

                    },
                    child:Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child:new Text("Developmental Training",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10))),



              ],
            ),
          ),

        ));
  }
}