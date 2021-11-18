import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:osis/view/training/training_view_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/model/wsq_model.dart';
import 'package:osis/widgets/pdf_viewer.dart';

import '../../locator.dart';

class TrainingWSQ extends StatefulWidget{

  @override
  _TrainingWSQState createState() => _TrainingWSQState();
}

class _TrainingWSQState extends State<TrainingWSQ> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<TrainingViewModel>(
        onModelReady: (viewModel) async {
          await viewModel.developmentWsq(context);
          },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("WSQ",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.wsqModel?.error!=null?Container(
                height: MediaQuery.of(context).size.height/1.5,
                alignment: Alignment.center,
                child:new Text("No Data",textScaleFactor: 1,style: TextStyle(fontSize: 22,),),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.wsqModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return codeConductWidget(model.wsqModel?.data?[index], context);

                  })
          ),

        ));
  }
  codeConductWidget(Data? data, BuildContext context){

    return GestureDetector(
      onTap: () async {
        if (data!.documentpath!.isEmpty) {
          await locator<DialogService>().showDialog(description: "No Record Found");

          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              PDdfViewer(data.documentpath, data.trainingname)),
        );
      },
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColor.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Text("Date : ${data?.completiondate}", textScaleFactor: 1,
                  style: AppTextStyle.subtitle6,),
                VerticalSpacing.d10px(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: new Text(
                      "${data?.trainingname}", textScaleFactor: 1,
                      style: AppTextStyle.subtitle10,)),

                    new Text("${data?.status}", textScaleFactor: 1,
                      style: AppTextStyle.subtitle10.copyWith(
                          color: data?.status?[0]=="P"||data?.status?[0]=="p"?AppColor.green:AppColor.red),),

                  ],
                ),

                VerticalSpacing.d10px(),
                new Text("${data?.trainingcode}", textScaleFactor: 1,
                  style: AppTextStyle.subtitle10,),
                VerticalSpacing.d10px(),


              ],
            )
        ),

    );
}}