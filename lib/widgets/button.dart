import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';


class Button extends StatelessWidget {

  final Key ?key;
  final String text;
  final TextStyle textStyle;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final BorderRadius ?borderRadius;
  final bool disabled;
  bool isIcon = false;
  bool isLoading = false;

  bool isOutline = false;

  Button(this.text, {@required this.key, this.textStyle = AppTextStyle.button, this.width = 160, this.height = 50, required this.onPressed,
    this.color = AppColor.buttonColor, this.borderColor = AppColor.buttonColor, this.borderRadius, this.disabled = false,this.isIcon=false,this.isLoading=false});

  Button.outline(this.text, {@required this.key, this.textStyle = AppTextStyle.button, this.width = 160, this.height = 50, required this.onPressed,
    this.color = Colors.transparent, this.borderColor = AppColor.buttonColor, this.borderRadius, this.disabled = false}){
    this.isOutline = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: disabled ? color.withOpacity(0.4) : color,
        borderRadius: borderRadius==null?new BorderRadius.all(const Radius.circular(0.0)):borderRadius,
        border: Border.all(color:disabled ? borderColor.withOpacity(0.1): borderColor),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:  FlatButton(
          key: key,
          onPressed: disabled ? null : onPressed,
          child: isLoading ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: AppColor.white, valueColor: AlwaysStoppedAnimation(AppColor.secondaryBackground),),
          ) : isIcon==true? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text, textScaleFactor: 1, style: textStyle, maxLines: 1, overflow: TextOverflow.fade,),
              CircleAvatar(
                radius: 15,
                backgroundColor:AppColor.background,
                child: Icon(Icons.arrow_forward_ios,color: AppColor.buttonColor,size:19.0,),
              )
            ],
          ): Text(text, textScaleFactor: 1, style: isOutline ? textStyle.copyWith(color: AppColor.buttonColor) : textStyle, maxLines: 1, overflow: TextOverflow.fade,),
        ),
      ),
    );
  }

}