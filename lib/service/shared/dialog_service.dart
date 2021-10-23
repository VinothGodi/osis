import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert_service/alert_request.dart';
import 'alert_service/alert_response.dart';



class DialogService {
  final _dialogNavigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;
  Function(AlertRequest) ?_showDialogListener;
  Function(AlertRequest) ?_showConfirmationDialogListener;

  Completer<AlertResponse> ?_dialogCompleter;
  Completer<AlertDatePickerResponse> ?_dateDialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener,  Function(AlertRequest) showConfirmationDialogListener  ) {
    _showDialogListener = showDialogListener;
    _showConfirmationDialogListener = showConfirmationDialogListener;
  }

  Future<AlertResponse> showDialog({String title = 'Message', required String description, String buttonTitle = 'OK', bool dismissable = true}) {
    _dialogCompleter = Completer<AlertResponse>();
   _showDialogListener!(AlertRequest(
        description: description,
        buttonTitle: buttonTitle,
        title: title,
      dismissable: dismissable, secondaryButtonTitle: ''
    ));

    return _dialogCompleter!.future;
  }



  Future<AlertResponse> showConfirmationAlertDialog({ required String title, required String subtitle, String primaryButton = 'OK', required String secondaryButton, bool dismissable = true}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showConfirmationDialogListener!(AlertRequest(
        //image: image,
        description: subtitle,
        buttonTitle: primaryButton,
        secondaryButtonTitle: secondaryButton,
        title: title,
      dismissable: dismissable,

    ));

    return _dialogCompleter!.future;
  }




  // showToast(String message,{ToastGravity gravity}){
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: gravity == null ? ToastGravity.BOTTOM : gravity,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black54,
  //       textColor: Colors.white,
  //       fontSize: 14.0
  //   );
  // }

  void dialogComplete(AlertResponse alertResponse) {
    _dialogCompleter?.complete(alertResponse);
    _dialogNavigationKey.currentState!.pop(alertResponse);
    _dialogCompleter = null;
  }

  void dialogDateComplete(AlertDatePickerResponse alertResponse) {
    _dateDialogCompleter!.complete(alertResponse);
    _dialogNavigationKey.currentState!.pop(alertResponse);
    _dateDialogCompleter = null;
  }

}
