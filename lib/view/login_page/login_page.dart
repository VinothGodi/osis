import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/view/login_page/login_view_model.dart';
import 'package:osis/widgets/alert_dialog.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/button.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final GlobalKey<State> _keyLoader = new GlobalKey<State>();
    return BaseView<LoginViewModel>(
        onModelReady: (viewModel) async {
          await viewModel.init();
    },
    builder: (context, model, child) =>Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("Online Security Integrated System",textAlign:TextAlign.center,textScaleFactor: 1,
              style: AppTextStyle.subtitle9.copyWith(color: AppColor.primaryBlue,fontSize: 20,fontWeight: FontWeight.w700),),
            VerticalSpacing.d15px(),
            Container(
            margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
              child: TextField(
                controller: model.companyName,
                autocorrect: false,
                focusNode: model.companyFocus,

                decoration: InputDecoration(
                  hintText: 'COMPANY NAME',
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
                      .requestFocus(model.userNameFocus,);
                },
              ),
            ),

            Container (
              margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
              child: TextField(
                controller: model.userName,
                autocorrect: false,
                focusNode: model.userNameFocus,

                decoration: InputDecoration(
                  hintText: 'USER NAME',
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
                      .requestFocus(model.passwordFocus,);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
              child: TextField(
                controller: model.password,
                autocorrect: false,
                focusNode: model.passwordFocus,

                decoration: InputDecoration(
                  hintText: 'PASSWORD',
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
                      .requestFocus(new FocusNode());
                },
              ),
            ),
            VerticalSpacing.d20px(),

            Button(
              
              "SIGN IN",
              width: 145,
              textStyle: TextStyle(color: AppColor.primaryBlue,fontSize:18),

              borderRadius: BorderRadius.circular(50),
              color: AppColor.white,
              onPressed: () async {

                Dialogs.showLoadingDialog(context, _keyLoader);
                await  model.submitLogin(context);
                FocusScope.of(context).requestFocus(new FocusNode());
              Navigator.of(context,rootNavigator: true).pop();
              }, key: Key("value")),
            VerticalSpacing.d20px(),
            new Text("Forget Password ? Click here",textAlign:TextAlign.center,textScaleFactor: 1,
              style: AppTextStyle.subtitle9),
          ],
        ),
      )

    ));

  }
}