import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/eleave_status_model.dart';
import 'package:osis/model/leave_detail_model.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:osis/widgets/alert_dialog.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/button.dart';
import 'package:osis/widgets/network_image_view.dart';

import '../../locator.dart';
import 'eleave_view_model.dart';


class ELeavePage extends StatefulWidget{
  @override
  _ELeavePageState createState() => _ELeavePageState();
}

class _ELeavePageState extends State<ELeavePage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

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
                      leaveCreate(model,context),

                    ]),
                  ),
                )
              ],
            ),
          ),

        ));
  }

  leaveCreate(ELeaveViewModel model, BuildContext context){

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Leave Type",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d5px(),

            DropdownButton<LeaveData>(

              hint: new Text("Select Leave Type"),


              style: AppTextStyle.subtitle9,
              isExpanded: true,
              underline: Container(
                height: 1.0,
                decoration:  BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:AppColor.primaryBlue,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
              items: model.leaveType?.map((LeaveData item) {
                return new DropdownMenuItem<LeaveData>(

                  child: new Text("${item.leavetype}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),
                  value: item,
                );
              }).toList(),
              onChanged: (LeaveData ?value){
                model.myLeaveType =value;
                model.selectedLeaveType(value);
                model.notifyListeners();
              },
              value: model.myLeaveType,
            ),

            VerticalSpacing.d15px(),


            new Text("Start Date",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d10px(),
            InkWell(
                onTap: (){
                  model.selectStartDate(context);

                },child:Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryBlue,)
                ),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    new Text(model.selectedStartDate.isEmpty?"Select Date":"${model.selectedStartDate}",textScaleFactor: 1,textAlign:TextAlign.center,
                      style: TextStyle(color: AppColor.subTextColor,fontSize:16,fontWeight: FontWeight.bold,),
                    ),
                    Icon(Icons.date_range,color: AppColor.primaryBlue,)
                  ],
                ))),
            VerticalSpacing.d15px(),

            new Text("End Date",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d10px(),
            InkWell(
                onTap: (){
                  model.selectEndDate(context);

                },child:Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryBlue,)
                ),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    new Text(model.selectedEndDate.isEmpty?"Select Date":"${model.selectedEndDate}",textScaleFactor: 1,textAlign:TextAlign.center,
                      style: TextStyle(color: AppColor.subTextColor,fontSize:16,fontWeight: FontWeight.bold,),
                    ),
                    Icon(Icons.date_range,color: AppColor.primaryBlue,)
                  ],
                ))),

            VerticalSpacing.d15px(),

            new Text("No of Days",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d10px(),
            TextField(
              controller: model.daysController,
              autocorrect: false,
              focusNode: model.daysFocus,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(fontSize: 14),
                contentPadding:  EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                filled: true,
                enabledBorder:  OutlineInputBorder(

                  borderSide: BorderSide(color: AppColor.primaryBlue, width:0),
                ),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryBlue, width:0),
                ),
                fillColor: AppColor.white,),
              onSubmitted: (String value){
                FocusScope.of(context)
                    .requestFocus(model.remarkFocus,);
              },
            ),
            VerticalSpacing.d15px(),
            new Text("Description",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),

            VerticalSpacing.d10px(),
            TextField(
              minLines: 5,
              controller: model.remarkController,
              maxLines: 10,
              focusNode: model.remarkFocus,
              autocorrect: false,

              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(color: AppColor.primaryBlue, width:0),
                  ) ,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(color: AppColor.primaryBlue, width:0),
                  ),
                  hintText: '',
                  filled: true,
                  border: InputBorder.none,
                  fillColor: AppColor.backgroundAll),
            ),
            VerticalSpacing.d30px(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(

                    "Cancel",
                    width: 145,
                    borderColor:  Colors.red,
                    color: Colors.red,
                    textStyle: TextStyle(color: AppColor.white,fontSize:18),
                    onPressed: () async {
                      Navigator.pop(context);
                    }, key: Key("Cancel")),
                HorizontalSpacing.d10px(),



                Button(

                    "Submit",
                    width: 145,
                    borderColor:  Colors.green,
                    textStyle: TextStyle(color: AppColor.white,fontSize:18),

                    // borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                    onPressed: () async {
                      if(model.myLeaveType==null){
                        await locator<DialogService>().showDialog(description: "Please select the Leave Type");
                        return;
                      }
                      if(model.selectedStartDate==""){
                        await locator<DialogService>().showDialog(description: "Please select the Start date");
                        return;
                      }

                      if(model.selectedEndDate==""){
                        await locator<DialogService>().showDialog(description: "Please select the End date");
                        return;
                      }


                      if(model.remarkController.text.isEmpty){
                        await locator<DialogService>().showDialog(description: "Please enter the remarks");
                        return;
                      }

                      Dialogs.showLoadingDialog(context, _keyLoader);
                      await  model.submitLeave(context);
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Navigator.of(context,rootNavigator: true).pop();
                      Navigator.pop(context);

                    }, key: Key("Submit")),
              ],
            )
          ],
        ),
      ),
    );

  }

  leaveDetailList(LeaveData? data){

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