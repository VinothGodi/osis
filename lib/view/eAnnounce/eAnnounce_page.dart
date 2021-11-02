import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/eannounce_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/model/ennounce_pdf_model.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../router.dart';
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
          await viewModel.init(context);
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
              child: model.eAnnounceModel?.error!=null?Center(child:
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

    return Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text("${data?.date} ${data?.day} ${data?.year}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
                new Text("${data?.priority}",textScaleFactor: 1,style:
                AppTextStyle.subtitle9.copyWith(color:AppColor.green),),
              ],
            ),

            VerticalSpacing.d10px(),
            new Text("${data?.ancetitle}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
            data?.description?.isEmpty==true?Container():  VerticalSpacing.d10px(),

            Html(data: '${data?.description}',),

            //new Text("${data?.description}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),

            data?.description?.isEmpty==true?Container(): VerticalSpacing.d15px(),

           new Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               InkWell(
                 onTap:(){
                   Navigator.pushNamed(context, Routes.eAnnounceImagePage,arguments:data?.ancecode );
                 },
                 child: Container(
                     child: new Text("IMAGE : ${data?.imageCount}",textScaleFactor: 1,style: data?.imageCount=="0"?AppTextStyle.subtitle6:AppTextStyle.subtitle9,)),
               ),

               InkWell(
                 onTap:(){
                   Navigator.pushNamed(context, Routes.eAnnounceImagePage,arguments:data?.ancecode );
                 },
                 child: Container(
                     child: new Text(data?.empack=="0"?"Acknowledge":"Acknowledged",textScaleFactor: 1,style: data?.empack=="0"?AppTextStyle.subtitle9:AppTextStyle.subtitle6,)),
               ),


              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, Routes.eAnnouncePDFPage,arguments:data?.ancecode );
                },
                child: Container(
                  child:  new Text("PDF : ${data?.pdfCount}",textScaleFactor: 1,style: data?.imageCount=="0"?AppTextStyle.subtitle6:AppTextStyle.subtitle9,),
                ),
              )
             ],
           )




          ],
        )
    );

  }
}