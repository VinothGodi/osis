import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/pdf_viewer.dart';

import 'eAnnounce_view_model.dart';
import 'package:osis/model/ennounce_pdf_model.dart';


class EAnnouncePDFPage extends StatefulWidget{

  String id;


  EAnnouncePDFPage(this.id);

  @override
  _EAnnouncePDFPageState createState() => _EAnnouncePDFPageState();
}

class _EAnnouncePDFPageState extends State<EAnnouncePDFPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<EAnnounceViewModel>(
        onModelReady: (viewModel) async {

          await viewModel.getEAnnouncePDF(widget.id);



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
              child: model.eAnnounceModel?.error!=null?Container(
                height: MediaQuery.of(context).size.height/1.5,
                alignment: Alignment.center,
                child:new Text("No Data",textScaleFactor: 1,style: TextStyle(fontSize: 22,),),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.eAnnouncePdfModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return eAnnouncePdfWidget(model.eAnnouncePdfModel?.data?[index],context);

                  })
          ),

        ));
  }
  eAnnouncePdfWidget(EAnnouncePDFData? data,BuildContext context){

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDdfViewer(data?.aImage,data?.fileName)),
        );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.picture_as_pdf,color: AppColor.primaryBlue,),
                  HorizontalSpacing.d10px(),
                  new Text("${data?.fileName}",textScaleFactor: 1,style:
                  AppTextStyle.subtitle6.copyWith(color:AppColor.green),),
                ],
              ),





            ],
          )
      ),
    );

  }
}