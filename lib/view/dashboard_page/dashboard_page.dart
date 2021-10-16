import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/dashboard_model.dart';
import 'package:osis/widgets/base_view.dart';

import '../../router.dart';
import 'dashboard_view_model.dart';

class DashBoardPage extends StatefulWidget{
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BaseView<DashboardViewModel>(
        onModelReady: (viewModel) async {
         await  viewModel.init();
    },
    builder: (context, model, child) =>Scaffold(
      backgroundColor: AppColor.backgroundAll,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        centerTitle: true,
        elevation: 0,
        title: new Text("Awnsys Technologies",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new_rounded,color: AppColor.white,), onPressed: () {  },
          ),
          HorizontalSpacing.d10px(),
        ],
      ),
      body:model.state == ViewState.Busy?Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 25),
              color: AppColor.primaryBlue,
              height: 100,
             child:  new Row(
               children: [
                 new Icon(Icons.person_rounded,color: AppColor.white,size: 50,),
                 HorizontalSpacing.d10px(),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     new Text("${model.loginModel?.data?[0].empcode}",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18),),
                     VerticalSpacing.d5px(),
                     new Text("${model.loginModel?.data?[0].empname}",textScaleFactor: 1,style: AppTextStyle.mediumWhite.copyWith(fontSize: 18),),

                   ],
                 ),

               ],
             ),

            ),

            VerticalSpacing.d15px(),

            Wrap(
                runSpacing: 30,
                spacing: 20,
                children: model.dashboardModel!.map((item) {
                  return new GestureDetector(
                    child: Container(
                        width: (MediaQuery.of(context).size.width / 2.9) - 30,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(color: AppColor.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,


                                children: [
                                  Image.asset(
                                    '${item.image}',
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 12)),
                                  new Text(
                                    '${item.name}',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColor.primaryBlue,
                                        fontSize: 16),
                                  )
                                ]),
                            Container(),
                          ],
                        )
                    ),
                    onTap: () {

                      redirection(model,item,context);



                    },
                  );
                }).toList()
            )
          ],
        ),
      )
    )
    );



  }
  redirection(DashboardViewModel model, DashboardModel item,BuildContext context){

    if(item.name=="Document") {
      Navigator.pushNamed(context, Routes.documentDashboard);

      return;
    }
    if(item.name=="Training") {
      Navigator.pushNamed(context, Routes.trainingDashboard);

      return;
    }

    if(item.name=="Rewards") {
      Navigator.pushNamed(context, Routes.rewardsPage);

      return;
    }
    if(item.name=="Payslip") {
      Navigator.pushNamed(context, Routes.paySlipDashboard);

      return;
    }
    if(item.name=="FeedBack") {
      Navigator.pushNamed(context, Routes.feedBackPage);

      return;
    }

    if(item.name=="eLeave") {
      Navigator.pushNamed(context, Routes.eLeavePage);

      return;
    }

    if(item.name=="eAnnounce") {
      Navigator.pushNamed(context, Routes.eAnnouncePage);

      return;
    }
  }
}