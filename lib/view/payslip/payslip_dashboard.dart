import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/payslip_year_model.dart';
import 'package:osis/widgets/base_view.dart';

import '../../router.dart';
import 'payslip_view_model.dart';

class PaySlipDashboard extends StatefulWidget{
  @override
  _PaySlipDashboardState createState() => _PaySlipDashboardState();
}

class _PaySlipDashboardState extends State<PaySlipDashboard> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<PayslipViewModel>(
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
            title: new Text("PaySlip",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child:model.paySlipYearModel?.error!=null?Center(child:
            new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: model.paySlipYearModel?.data?.length,

                itemBuilder: (BuildContext context,int index){

                  return paySlipYearWidget(model.paySlipYearModel?.data?[index],context);

                })
          ),

        ));
  }

  paySlipYearWidget(Data? data, BuildContext context){

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.paySlipPage,arguments: data?.year);
      },
      child: Container(
        alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),

          ),
          child:new Text("${data?.year}",textScaleFactor: 1,textAlign:TextAlign.center,style: AppTextStyle.subtitle10)),
    );
  }
}