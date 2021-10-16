
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/service/shared/alert_service/alert_request.dart';
import 'package:osis/service/shared/alert_service/alert_response.dart';
import 'package:osis/service/shared/dialog_service.dart';



import '../locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({ Key? key, required this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    print("EXECUTE");
    _dialogService.registerDialogListener(_showInfoDialog, _showConfirmationDialog);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Dialog Manager being built");
    return Stack(
      children: [

        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: widget.child
        ),



      ],
    );
  }


  void _showInfoDialog(AlertRequest request) {
    showDialog(
        context: context,
        barrierDismissible: request.dismissable,
        builder: (context) {
          return WillPopScope(
              onWillPop: () async {
                _dialogService.dialogComplete(AlertResponse(status: false));
                return false;
              },
              child: AlertDialog(
                title: Text(
                  request.title,
                  style: AppTextStyle.subtitle1,textScaleFactor: 1,
                ),
                content: Text(request.description, style: AppTextStyle.body1,textScaleFactor: 1,),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      request.buttonTitle,
                      style: AppTextStyle.button,textScaleFactor: 1,
                    ),
                    onPressed: () {
                      _dialogService.dialogComplete(AlertResponse(status: true));
                    },
                  ),
                ],
              ));
        });
  }

  void _showConfirmationDialog(AlertRequest request) {
    showDialog(
        context: context,
        barrierDismissible: request.dismissable == null ? true : request.dismissable,
        builder: (context) {
          return WillPopScope(
              onWillPop: () async {
                print('asdasdas');
                _dialogService.dialogComplete(AlertResponse(status: false));
                return false;
              },
              child: AlertDialog(
                title: Text(
                  request.title,
                  style: AppTextStyle.subtitle1,textScaleFactor: 1,
                ),
                content: Text(request.description,textScaleFactor: 1, style: AppTextStyle.body1),
                actions: <Widget>[

                  if (request.secondaryButtonTitle != null) FlatButton(
                    child: Text(
                      request.secondaryButtonTitle,textScaleFactor: 1,
                      style: AppTextStyle.button,
                    ),
                    onPressed: () {
                      _dialogService.dialogComplete(AlertResponse(status: false));
                    },
                  ),

                  FlatButton(
                    child: Text(
                      request.buttonTitle,
                      style: AppTextStyle.button,textScaleFactor: 1,
                    ),
                    onPressed: () {
                      _dialogService.dialogComplete(AlertResponse(status: true));
                    },
                  ),

                ],
              ));
        });
  }









}