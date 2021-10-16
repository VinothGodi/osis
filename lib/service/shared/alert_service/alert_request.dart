import 'package:flutter/cupertino.dart';

class AlertRequest {
  final String ?image;
  final String title;
  final String description;
  final String buttonTitle;
  final String secondaryButtonTitle;
  final bool dismissable;

  final Widget ?iconWidget;
  final Widget ?contentWidget;
  final bool ?showActionBar;
  final bool ?showCloseIcon;



  AlertRequest({
    this.image,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.secondaryButtonTitle,
    required this.dismissable, this.iconWidget,
    this.showActionBar,
    this.contentWidget,this.showCloseIcon
  });
}
