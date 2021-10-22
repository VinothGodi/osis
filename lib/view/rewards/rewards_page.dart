import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/rewards_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/network_image_view.dart';
import 'package:osis/widgets/pdf_viewer.dart';

import 'rewars_view_model.dart';

class RewardsPage extends StatefulWidget{

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<RewardsViewModel>(
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
            title: new Text("Rewards",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.rewardsModel?.data?.length==0?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.rewardsModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return codeConductWidget(model.rewardsModel?.data?[index], context);

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
                  new Text("${data?.rewarddate}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
                  new Text("${data?.status}",textScaleFactor: 1,style:
                  AppTextStyle.subtitle6.copyWith(color: AppColor.green),),
                ],
              ),

              VerticalSpacing.d10px(),
              new Text("${data?.rewardtype}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
              VerticalSpacing.d10px(),

              new Text("${data?.remarks}",textScaleFactor: 1,style: AppTextStyle.subtitle9,overflow: TextOverflow.ellipsis,),

              VerticalSpacing.d10px(),


              new Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 InkWell(
                     onTap:(){
                       if(data!.rewardimage!.isEmpty){
                         return;
                       }
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => NetworkImageView(data.rewardimage.toString())),
                       );


                     },
                     child: new Text("IMAGE",textScaleFactor: 1,style: AppTextStyle.subtitle10,)),
                 InkWell(
                     onTap:(){
                       if(data!.rewarddocument!.isEmpty){
                           Fluttertoast.showToast(
                               msg: "No Document",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity:  ToastGravity.BOTTOM,
                               timeInSecForIosWeb: 1,
                               backgroundColor: Colors.black54,
                               textColor: Colors.white,
                               fontSize: 14.0
                           );
                         return;
                       }
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => PDdfViewer(data.rewarddocument,"Document")),
                       );



                     },
                     child: new Text("Document",textScaleFactor: 1,style: AppTextStyle.subtitle10,)),
               ],
             ),







            ],
          )
      ),
    );

  }
}