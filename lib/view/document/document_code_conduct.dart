import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/code_conduct_model.dart';
import 'package:osis/view/document/document_view_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/pdf_viewer.dart';

class DocumentCodeConduct extends StatefulWidget{

  @override
  _DocumentCodeState createState() => _DocumentCodeState();
}

class _DocumentCodeState extends State<DocumentCodeConduct> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<DocumentViewModel>(
        onModelReady: (viewModel) async {

          await viewModel.codeConductInit(context);

        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("Code Conduct",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.codeConductModel?.error!=null?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.codeConductModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return codeConductWidget(model.codeConductModel?.data?[index], context);

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
              new Text("${data?.documentdate}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
              VerticalSpacing.d10px(),
              new Text("${data?.documentname}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),

              VerticalSpacing.d15px(),

              InkWell(
                  onTap:(){
                    if(data!.documentpath!.isEmpty){
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDdfViewer(data.documentpath,data.documentname)),
                    );


                  },
                  child: new Text("DOCUMENT PDF",textScaleFactor: 1,style: AppTextStyle.subtitle6,)),




            ],
          )
      ),
    );

  }
}