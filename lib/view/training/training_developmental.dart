import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/training_development_model.dart';
import 'package:osis/view/training/training_view_model.dart';
import 'package:osis/widgets/base_view.dart';

class TrainingDevelopmental extends StatefulWidget{

  @override
  _TrainingDevelopmentalState createState() => _TrainingDevelopmentalState();
}

class _TrainingDevelopmentalState extends State<TrainingDevelopmental> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<TrainingViewModel>(
        onModelReady: (viewModel) async {
         await viewModel.developmentInit(context);



        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("Development Training",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.trainingDevelopmentModel?.data?.length==0?Center(child:
              new Text("No Data",textScaleFactor: 1,),):ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.trainingDevelopmentModel?.data?.length,

                  itemBuilder: (BuildContext context,int index){

                    return codeConductWidget(model.trainingDevelopmentModel?.data?[index], context);

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
                  new Text("${data?.date}",textScaleFactor: 1,style: AppTextStyle.subtitle6,),
                  new Text(data?.iscompleted=="True"?"Completed":"Pending",textScaleFactor: 1,style:
                  AppTextStyle.subtitle6.copyWith(color: data?.iscompleted=="True"?AppColor.green:AppColor.red),),
                ],
              ),

              VerticalSpacing.d10px(),
              new Text("${data?.title}",textScaleFactor: 1,style: AppTextStyle.subtitle10,),
              VerticalSpacing.d10px(),
              new Text("${data?.terrortype}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),
              VerticalSpacing.d15px(),

              new Text("${data?.terrorgroup}",textScaleFactor: 1,style: AppTextStyle.subtitle9,),




            ],
          )
      ),
    );

  }
}