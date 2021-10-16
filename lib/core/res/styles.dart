
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'colors.dart';
import 'fontsize.dart';


class AppStyle {

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColor.white,
    primaryColorDark: AppColor.white,
    accentColor: AppColor.accent,
    dividerColor: AppColor.divider,
    brightness: Brightness.light,
    indicatorColor: AppColor.white,
    textTheme: TextTheme(
        button: TextStyle(color: AppColor.black)
    ),
    primaryIconTheme: const IconThemeData.fallback().copyWith(
        color: AppColor.black
    ),
    appBarTheme: AppBarTheme().copyWith(
      elevation: 0.5,
      color: AppColor.white,
    ),
    backgroundColor: AppColor.background,
    fontFamily: "Roboto",
    scaffoldBackgroundColor: AppColor.background,
  );

  static final List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black12, spreadRadius: 0.3, blurRadius: 5),
  ];

  static final Widget customDivider = Divider(color: AppColor.divider, thickness: 0.3,);

  static final List<BoxShadow> cardShadow1= [
    // BoxShadow(color: Colors.black12, spreadRadius: 0.3, blurRadius: 5),
    BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 15),
  ];

  static final Widget dividerContainer = Container(
      padding: EdgeInsets.only(left: 15,right: 15,),
      height:1,child: AppStyle.customDivider);

  static final List<BoxShadow> mildCardShadow = [
    BoxShadow(color: Colors.black12, spreadRadius: 0.1, blurRadius: 1),
  ];




  static final BoxDecoration drawerMenuColor =
  new BoxDecoration(
    gradient: new LinearGradient(
       begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF0F8A96FD),
        Color(0xFF0F8A96FD),


      ],),

  );
  static List<Shadow> textShadow = <Shadow>[
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black12,
    ),
  ];

  static setSystemUIOverlayStyle(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryBlue,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.white,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

}



class AppTextStyle {


  static const TextStyle  headlineMaxPro = TextStyle(
    fontSize: AppFontSize.dp38,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static const TextStyle  appBarTitle = TextStyle(
    fontSize: AppFontSize.dp18,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: AppFontSize.dp18,
    fontWeight: FontWeight.w700,
    color: AppColor.accent
  );

  static const TextStyle headline6 = TextStyle(
      fontSize: AppFontSize.dp18,
      fontWeight: FontWeight.w700,
      color: AppColor.text
  );
  static const TextStyle test = TextStyle(
      fontSize: AppFontSize.dp18,
      fontWeight: FontWeight.w700,
      color: AppColor.boldText
  );

  static const TextStyle headline7 = TextStyle(
      fontSize: AppFontSize.dp20,
      fontWeight: FontWeight.w700,
      color: AppColor.text
  );

  static const TextStyle subtitle9 = TextStyle(  // Bold Text
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w500,
      color: AppColor.boldText
  );
  static  TextStyle subtitle10 = TextStyle(  // Bold Text
      fontSize: AppFontSize.dp18,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryBlue
  );
  static const TextStyle subtitle6 = TextStyle(  // Sub Text Color // Regular Text // font size 16
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w400,
      color: AppColor.subTextColor
  );

  static const TextStyle subtitle7 = TextStyle( // Sub Text Bold Color
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w500,
      color: AppColor.subTextBoldColor
  );

  static const TextStyle subtitle8 = TextStyle( // Sub Text Bold Color // font size 14
      fontSize: AppFontSize.dp14,
      fontWeight: FontWeight.w400,
      color: AppColor.subTextColor
  );

  static const TextStyle headline8 = TextStyle(
      fontSize: AppFontSize.dp18,
      fontWeight: FontWeight.w500,
      color: AppColor.black
  );

  static const TextStyle calendarHeader = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w500,
      color: AppColor.accent
  );
  static const TextStyle date = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w500,
      color: AppColor.boldText
  );



  static const TextStyle subtitle1 = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w600,
      color: AppColor.text
  );

  static const TextStyle subtitle2 = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w600,
      color: AppColor.text
  );
  static const TextStyle subtitle3 = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w400,
      color: AppColor.text
  );

  static const TextStyle body1 = TextStyle(
      fontSize: AppFontSize.dp14,
      fontWeight: FontWeight.w400,
      color: AppColor.text
  );

  static const TextStyle body2 = TextStyle(
      fontSize: AppFontSize.dp12,
      fontWeight: FontWeight.w400,
      color: AppColor.text,
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppFontSize.dp10,
    fontWeight: FontWeight.w500,
    color: AppColor.secondaryText,
  );
  static const TextStyle captions = TextStyle(
    fontSize: AppFontSize.dp12,
    fontWeight: FontWeight.w500,
    color: AppColor.secondaryText,
  );
  static  TextStyle caption2 = TextStyle(
    fontSize: AppFontSize.dp16,
    fontWeight: FontWeight.w500,
    color: AppColor.black.withOpacity(0.4),
  );

  static const TextStyle button = TextStyle(
      fontSize: AppFontSize.dp18,
      fontWeight: FontWeight.bold,
      color: AppColor.black
  );


  static const TextStyle redText = TextStyle(
    fontSize: AppFontSize.dp14,
    fontWeight: FontWeight.w500,
    color: AppColor.red,
  );

  static const TextStyle textWhiteLarge = TextStyle(
    fontSize: AppFontSize.dp38,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );





 static const TextStyle smallWhiteText = TextStyle(
   fontSize: AppFontSize.dp16,
   fontWeight: FontWeight.w300,
   color: AppColor.white,
 );
  static const TextStyle smallRegularWhiteText = TextStyle(
    fontSize: AppFontSize.dp14,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static const TextStyle mediumWhiteBold = TextStyle(
      fontSize: AppFontSize.dp20,
      fontWeight: FontWeight.w700,
      color: AppColor.white
  );

  static const TextStyle mediumWhite = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.w400,
      color: AppColor.white
  );


}