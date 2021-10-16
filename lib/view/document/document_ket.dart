import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/ket_model.dart';
import 'package:osis/view/document/document_view_model.dart';
import 'package:osis/widgets/alert_dialog.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/pdf_viewer.dart';

class DocumentKet extends StatefulWidget{
  @override
  _DocumentKetState createState() => _DocumentKetState();
}

class _DocumentKetState extends State<DocumentKet> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<DocumentViewModel>(
        onModelReady: (viewModel) async {

         await viewModel.documentKetInit();


        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("KET",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.ketModel?.data?.length==0?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.ketModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return ketWidget(model.ketModel?.data?[index], context,model);

                  })
          ),

        ));
  }
  ketWidget(Data? data, BuildContext context, DocumentViewModel model){

    return GestureDetector(
      onTap: () async {
        Dialogs.showLoadingDialog(context, _keyLoader);

        await model.getKetDoc(data?.kETID);

        Navigator.of(context,rootNavigator: true).pop();

        if(model.ketDocApi?.data!=null){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDdfViewer(model.ketDocApi?.data?[0].ketfilename,"KET")),
          );
        }

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
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Icon(Icons.person,color: AppColor.primaryBlue,size: 40,),
           HorizontalSpacing.d20px(),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               new Text("Date Issued On ${data?.dateIssuedOn}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
               VerticalSpacing.d10px(),
               new Text("${data?.empName}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),

               VerticalSpacing.d10px(),
             ],
           )



            ],
          )
      ),
    );

  }
}