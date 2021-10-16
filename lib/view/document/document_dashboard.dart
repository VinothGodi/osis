import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/view/document/document_view_model.dart';
import 'package:osis/widgets/base_view.dart';

import '../../router.dart';

class DocumentDashboard extends StatefulWidget{
  @override
  _DocumentDashboardState createState() => _DocumentDashboardState();
}

class _DocumentDashboardState extends State<DocumentDashboard> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<DocumentViewModel>(
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
        title: new Text("Document",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, Routes.documentSop);

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
               child:new Text("SOP",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10)),
            ),
            GestureDetector(
             onTap: (){

                Navigator.pushNamed(context, Routes.documentCodeConduct);

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
                child:new Text("Code of Conduct",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10))),
            GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, Routes.documentEmployeeHandbook);

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
                  child:new Text("Employee HandBook",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10)),
            ),
            GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, Routes.documentKet);

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
                  child:new Text("KET",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10)),
            ),

          ],
        ),
      ),

    ));
  }
}