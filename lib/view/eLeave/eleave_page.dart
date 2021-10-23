import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/eleave_status_model.dart';
import 'package:osis/model/leave_detail_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/network_image_view.dart';

import 'eleave_view_model.dart';


class ELeavePage extends StatefulWidget{
  @override
  _ELeavePageState createState() => _ELeavePageState();
}

class _ELeavePageState extends State<ELeavePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseView<ELeaveViewModel>(
        onModelReady: (viewModel) async {
          await  viewModel.init(context);
        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("ELeave",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: DefaultTabController(
            length: 3,

            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      tabs: [
                        Tab(text: "DETAILS"),
                        Tab(text: "STATUS"),
                        Tab(text: "APPLY"),
                      ],
                      indicatorColor:AppColor.primaryBlue
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(children: [
                      model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):  model.leaveDetailModel?.data==null?Center(child:
                      new Text("No Data",textScaleFactor: 1,),): ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: model.leaveDetailModel?.data?.length,

                          itemBuilder: (BuildContext context,int index){

                            return leaveDetailList(model.leaveDetailModel?.data?[index]);

                          }),
                      model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):  model.eLeaveStatusModel?.data==null?Center(child:
                      new Text("No Data",textScaleFactor: 1,),): ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: model.eLeaveStatusModel?.data?.length,

                          itemBuilder: (BuildContext context,int index){

                            return leaveStatusList(model.eLeaveStatusModel?.data?[index]);

                          }),
                      Container(
                        child: Text("Create"),
                      ),

                    ]),
                  ),
                )
              ],
            ),
          ),

        ));
  }

  leaveDetailList(Data? data){

    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.black.withOpacity(0.1)),

        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,

              color: AppColor.primaryBlue,
              child: new Text("${data?.leavetype}",textScaleFactor: 1,style: AppTextStyle.subtitle6.copyWith(color: AppColor.white),),
            ),


            VerticalSpacing.d10px(),

            new Text("Total Leave ${data?.totalleave}",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(color: AppColor.greenText),),
            VerticalSpacing.d10px(),
            new Text("Leave Taken ${data?.leavetaken}",textScaleFactor: 1,style: AppTextStyle.subtitle6.copyWith(color: AppColor.red)),
            VerticalSpacing.d10px(),
            new Text("Pending Leave ${data?.pendingleave}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),







          ],
        )
    );

  }



  leaveStatusList(StatusData? data){

    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.black.withOpacity(0.1)),

        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text("${data?.name}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
                new Text("${data?.status}",textScaleFactor: 1,style:
                AppTextStyle.subtitle6.copyWith(color:data?.status=="Approved"?AppColor.green:AppColor.red),),
              ],
            ),

            VerticalSpacing.d10px(),
            new Text("Period ${data?.startDate} - ${data?.endDate}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
            VerticalSpacing.d10px(),
            new Text("Total Days : ${data?.noofdays}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),





          ],
        )
    );

  }
}