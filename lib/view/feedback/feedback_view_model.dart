import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/spacing.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/feedback_create_model.dart';
import 'package:osis/model/feedback_model.dart';
import 'package:osis/service/shared/dialog_service.dart';

import '../../locator.dart';
import '../../router.dart';
import 'feedback_page.dart';


class FeedbackViewModel extends BaseViewModel{
  FeedBackModel ?feedBackModel;
  List<FeedBackType> feedBackType=[];
  DateTime now = DateTime.now();
  String selectedDate="";
  File? feedBackImage;
  FeedBackCreateModel ?response;
  ImagePicker picker = ImagePicker();

  TextEditingController descriptionController= new TextEditingController();

  FeedBackType ?myFeedBackType;



  init(BuildContext context) async{

  setState(ViewState.Busy);

  feedBackModel = await api.getFeedbackApi();

  if(feedBackModel?.responseCode==400){

    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
    return;

  }


  feedBackType.add(new FeedBackType("Suggestions"));
    
  setState(ViewState.Idle);

   notifyListeners();


  }

  selectedFeedBackType(FeedBackType ?value) async {

    myFeedBackType = value;
    notifyListeners();

  }

  receiptImageCall(BuildContext context) async {
    print("Get Image");
    getImage(context);
  }
  Future getImage(BuildContext context) async {

    showModalBottomSheet(context: context, builder: (BuildContext context) => Container(
      height: 300,
      padding: EdgeInsets.all(15),
      child: new Column(
        children: <Widget>[

          InkWell(
              onTap:(){
                Navigator.pop(context, 1);
                notifyListeners();
              },
              child:   new Row(
                children: <Widget>[

                  Icon(Icons.camera_alt),


                  Padding(padding: EdgeInsets.only(left: 20)),

                  new Text("Camera", textScaleFactor: 1, style: TextStyle(fontSize: 16),)

                ],
              ),),
          VerticalSpacing.d15px(),
          InkWell(
              onTap:(){
                Navigator.pop(context, 2);
                notifyListeners();
              },
              child:   new Row(
                children: <Widget>[

                  Icon(Icons.image),


                  Padding(padding: EdgeInsets.only(left: 20)),

                  new Text("Gallery", textScaleFactor: 1, style: TextStyle(fontSize: 16),)

                ],
              ),),



        ],
      ),
    )).then((response) async {
      print(response);
      if (response != null){

        if (response == 1){
          final pickedFile = await picker.getImage(source: ImageSource.camera);
          if (pickedFile != null) {
            feedBackImage = File(pickedFile.path);
          }
          notifyListeners();


        }
        else if (response == 2) {
          final pickedFile = await picker.getImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            feedBackImage = File(pickedFile.path);
          }
          notifyListeners();

        }


      }
    });


  }

  bottomItem(IconData icon, String title, Function onPressed){
    return InkWell(onTap:() => onPressed, child: Column(
      children: <Widget>[
        new Row(
          children: <Widget>[

            Icon(icon),

            Padding(padding: EdgeInsets.only(left: 20)),

            new Text(title, textScaleFactor: 1, style: TextStyle(fontSize: 16),)

          ],
        ),

        Padding(padding: EdgeInsets.only(top: 15)),


        Padding(padding: EdgeInsets.only(top: 15)),

      ],
    ));
  }

  Future<void> selectDate(BuildContext context) async {

    final DateTime ?picked = await showDatePicker(
        context: context,

        initialDate: now,

        lastDate: DateTime(2101),
        firstDate: DateTime.now());


    if (picked != null)
      selectedDate= picked.toString();
    notifyListeners();
  }

  submitFeedBack(BuildContext context) async{



  /*  if(feedBackImage==null){
      await locator<DialogService>().showDialog(description: "Please select the image");
      return;
    }*/

    setState(ViewState.Busy);
     response=  await api.feedBackCreateApi(feedBackImage,selectedDate,myFeedBackType!.name,descriptionController.text);


    if(response?.responseCode==400){
      setState(ViewState.Idle);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    if(response?.responseCode==201){
      setState(ViewState.Idle);
      Navigator.of(context,rootNavigator: true).pop();

      await locator<DialogService>().showDialog(description: response!.responseMessage.toString());
      Navigator.pop(context);
    }



  }

}