import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/images.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/locator.dart';
import 'package:osis/model/feedback_model.dart';
import 'package:osis/model/feedback_type_model.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:osis/widgets/alert_dialog.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/button.dart';
import 'package:osis/widgets/network_image_view.dart';

import 'feedback_view_model.dart';

class FeedBackPage extends StatefulWidget{
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<FeedbackViewModel>(
        onModelReady: (viewModel) async {
      await  viewModel.init(context);
    },
        onModelDisposed: (viewModel){
        },
    builder: (context, model, child) =>WillPopScope(
      onWillPop: () async{
        return model.state == ViewState.Busy?false:true;
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundAll,
        appBar: AppBar(
          backgroundColor: AppColor.primaryBlue,
          centerTitle: true,
          leading: IconButton(onPressed: (){

            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
          title: new Text("FeedBack",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

        ),
        body: DefaultTabController(
          length: 2,

          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 50),
                child: TabBar(
                    tabs: [
                  Tab(text: "LISTS"),
                  Tab(text: "CREATE"),
                ],
                  indicatorColor:AppColor.primaryBlue
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(children: [
                    model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):  model.feedBackModel?.data==null?Center(child:
                    new Text("No Data",textScaleFactor: 1,),): ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: model.feedBackModel?.data?.length,

                        itemBuilder: (BuildContext context,int index){

                          return feedBackList(model.feedBackModel?.data?[index]);

                        }),
                    feedBackCreate(model,context),

                  ]),
                ),
              )
            ],
          ),
        ),

      ),
    ));
  }

  feedBackList(Data? data){

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
            new Text("${data?.feedbackdate}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),


            VerticalSpacing.d10px(),

            new Text("${data?.feedbacktype}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
            VerticalSpacing.d10px(),
            new Text("${data?.description}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
            VerticalSpacing.d10px(),

            InkWell(
                onTap:(){
                  if(data!.feedbackimage!.isEmpty){
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NetworkImageView(data.feedbackimage.toString())),
                  );


                },
                child: new Text("IMAGE",textScaleFactor: 1,style: AppTextStyle.subtitle9,)),





          ],
        )
    );

  }

  feedBackCreate(FeedbackViewModel model, BuildContext context){

    return SingleChildScrollView(

      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            new Text("FeedBack Type",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d5px(),

            DropdownButton<FeedBackType>(

              hint: new Text("Select FeedBack Type"),


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
              items: model.feedBackType?.map((FeedBackType item) {
                return new DropdownMenuItem<FeedBackType>(

                  child: new Text("${item.feedbacktype}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),
                  value: item,
                );
              }).toList(),
              onChanged: (FeedBackType ?value){
                model.myFeedBackType =value;
                model.selectedFeedBackType(value);
                model.notifyListeners();
              },
              value: model.myFeedBackType,
            ),

            VerticalSpacing.d15px(),

            new Text("FeedBack Date",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),
            VerticalSpacing.d10px(),
            InkWell(
                onTap: (){

                  model.selectDate(context);

                },child:Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryBlue,)
                ),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    new Text(model.selectedDate.isEmpty?"Select Date":"${model.selectedDate}",textScaleFactor: 1,textAlign:TextAlign.center,
                      style: TextStyle(color: AppColor.subTextColor,fontSize:16,fontWeight: FontWeight.bold,),
                    ),
                    Icon(Icons.date_range,color: AppColor.primaryBlue,)
                  ],
                ))),



            VerticalSpacing.d15px(),


            new Text("Description",textScaleFactor: 1,style: AppTextStyle.subtitle10.copyWith(fontWeight: FontWeight.w500 ,fontSize: 16) ,),

            VerticalSpacing.d10px(),
            TextField(
              minLines: 5,
              controller: model.descriptionController,
              maxLines: 10,
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
            VerticalSpacing.d15px(),

            model.feedBackImage!=null? InkWell(
                onTap: (){

                },
                child:  Image.file(File(model.feedBackImage!.path),
                  width: double.infinity,height: 250,fit: BoxFit.cover,)): InkWell(
                onTap: (){
                  model.receiptImageCall(context);
                },
                child: Image.asset(Images.gallery,width: 100,height:100,color: AppColor.primaryBlue,)),
            VerticalSpacing.d30px(),

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(

                  "Cancel",
                  width: 145,
                  borderRadius: BorderRadius.all(const Radius.circular(7)),
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
                  borderRadius: BorderRadius.all(const Radius.circular(7)),
                  borderColor:  Colors.green,
                  textStyle: TextStyle(color: AppColor.white,fontSize:18),

                  // borderRadius: BorderRadius.circular(50),
                  color: Colors.green,
                  onPressed: () async {

                    if(model.myFeedBackType==null){
                      await locator<DialogService>().showDialog(description: "Please select the feedbacktype");
                      return;
                    }
                    if(model.selectedDate==""){
                      await locator<DialogService>().showDialog(description: "Please select the date");
                      return;
                    }


                    if(model.descriptionController.text.isEmpty){
                      await locator<DialogService>().showDialog(description: "Please enter the description");
                      return;
                    }

                    if(model.feedBackImage==null){
                      await locator<DialogService>().showDialog(description: "Please select the image");
                      return;
                    }

                    Dialogs.showLoadingDialog(context, _keyLoader);
                     await  model.submitFeedBack(context);
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
}
