import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/payslip_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/pdf_viewer.dart';

import '../../router.dart';
import 'payslip_view_model.dart';

class PaySlipPage extends StatefulWidget{
  String ?year;

  PaySlipPage(this.year);

  @override
  _PaySlipPageState createState() => _PaySlipPageState();
}

class _PaySlipPageState extends State<PaySlipPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<PayslipViewModel>(
        onModelReady: (viewModel) async {

          await viewModel.paySlipInit(widget.year,context);

        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("PaySlip",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child:model.paySlipModel?.error!=null?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.paySlipModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return paySlipYearWidget(model.paySlipModel?.data?[index]);

                  })
          ),

        ));
  }

  paySlipYearWidget(Data? data){

    return GestureDetector(
      onTap: (){
        if(data!.documentpath!.isEmpty){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDdfViewer(data.documentpath,data.month)),
        );
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
          child:new Row(
            children: [
              Icon(Icons.picture_as_pdf,color: AppColor.primaryBlue,size: 40,),
              HorizontalSpacing.d10px(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("Created On : ${data?.documentdate}",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle6),
                  VerticalSpacing.d10px(),
                  new Text("${data?.month}",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10),
                ],
              )
            ],
          )
      ),
    );
  }
}