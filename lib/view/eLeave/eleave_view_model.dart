import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/eleave_create_model.dart';
import 'package:osis/model/eleave_status_model.dart';
import 'package:osis/model/leave_detail_model.dart';
import 'package:osis/service/shared/dialog_service.dart';

import '../../locator.dart';
import '../../router.dart';

class ELeaveViewModel extends BaseViewModel {
  EleaveCreateModel ?eleaveCreateModel;
  LeaveDetailModel ?leaveDetailModel;
  TextEditingController daysController = new TextEditingController();
  TextEditingController remarkController = new TextEditingController();
  FocusNode remarkFocus = new FocusNode();

  FocusNode daysFocus = new FocusNode();
  List<LeaveData> ?leaveType;

  LeaveData? myLeaveType;

  ELeaveStatusModel ?eLeaveStatusModel;
  DateTime now = DateTime.now();
  String selectedStartDate="",selectedEndDate="";

  init(BuildContext context) async{

    setState(ViewState.Busy);
    leaveDetailModel = await api.getLeaveDetailApi();




    if(leaveDetailModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }
    leaveType = leaveDetailModel?.data;

    eLeaveStatusModel = await api.getLeaveStatusApi();


    if(leaveDetailModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    print(leaveType?.length);



    setState(ViewState.Idle);
    notifyListeners();
  }

  selectedLeaveType(LeaveData ?value) async {

    myLeaveType = value;
    notifyListeners();

  }


  Future<void> selectStartDate(BuildContext context) async {
    late DateTime  selected;
    final DateTime ?picked = await showDatePicker(
        context: context,

        initialDate: now,


        lastDate: DateTime(2101),
        firstDate: DateTime.now());


    if (picked != null)
      selected= picked;
    selectedStartDate = new DateFormat("dd/MM/yyyy").format(selected);

    if(selectedEndDate.trim().isNotEmpty && selectedStartDate.trim().isNotEmpty ){
      DateFormat inputFormat = DateFormat('dd/MM/yyyy');

      DateTime start = inputFormat.parse(selectedStartDate);
      DateTime end = inputFormat.parse(selectedEndDate);

      daysController.text = end.difference(start).inDays.toString();

    }

    notifyListeners();
  }


  Future<void> selectEndDate(BuildContext context) async {
    late DateTime  selected;
    final DateTime ?picked = await showDatePicker(
        context: context,

        initialDate: now,


        lastDate: DateTime(2101),
        firstDate: DateTime.now());


    if (picked != null)
      selected= picked;
    selectedEndDate = new DateFormat("dd/MM/yyyy").format(selected);

    if(selectedEndDate.trim().isNotEmpty || selectedStartDate.trim().isNotEmpty ){

      DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      DateTime start = inputFormat.parse(selectedStartDate.trim());

      DateTime end = inputFormat.parse(selectedEndDate.trim());

      daysController.text = end.difference(start).inDays.toString();

    }

    notifyListeners();
  }


  submitLeave(BuildContext context) async{


    setState(ViewState.Busy);



    eleaveCreateModel=  await api.eLeaveCreate(selectedStartDate,selectedEndDate,remarkController.text,myLeaveType?.category);


    if(eleaveCreateModel?.responseCode==400){
      setState(ViewState.Idle);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }

    if(eleaveCreateModel?.error!=null){
      setState(ViewState.Idle);

      await locator<DialogService>().showDialog(description: eleaveCreateModel!.error.toString(),dismissable: false);
   return;
    }


    if(eleaveCreateModel?.responseCode==200){
      setState(ViewState.Idle);

      await locator<DialogService>().showDialog(description: eleaveCreateModel!.data![0].message!.toString(),dismissable: false);
    }



  }

}