import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/eannounce_model.dart';
import 'package:osis/widgets/base_view.dart';

import 'eAnnounce_view_model.dart';

class EAnnouncePage extends StatefulWidget{

  @override
  _EAnnouncePageState createState() => _EAnnouncePageState();
}

class _EAnnouncePageState extends State<EAnnouncePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<EAnnounceViewModel>(
        onModelReady: (viewModel) async {
          await viewModel.init();



        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("eAnnouncements",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.eAnnounceModel?.data?.length==0?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.eAnnounceModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return codeConductWidget(model.eAnnounceModel?.data?[index], context);

                  })
          ),

        ));
  }
  codeConductWidget(Data? data, BuildContext context){

    return GestureDetector(
      onTap: (){

      },
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),

          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text("${data?.date} ${data?.day} ${data?.year}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
                  new Text("${data?.priority}",textScaleFactor: 1,style:
                  AppTextStyle.subtitle6.copyWith(color:AppColor.green),),
                ],
              ),

              VerticalSpacing.d10px(),
              new Text("${data?.ancetitle}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
              VerticalSpacing.d10px(),
              new Text("${data?.description}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
              VerticalSpacing.d15px(),

             new Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 new Text("Image : ${data?.imageCount}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),
                 new Text("Pdf : ${data?.pdfCount}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),
               ],
             )




            ],
          )
      ),
    );

  }
}