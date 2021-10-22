import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/code_conduct_model.dart';
import 'package:osis/model/employee_handbook_model.dart';
import 'package:osis/model/ket_doc_model.dart';
import 'package:osis/model/ket_model.dart';
import 'package:osis/model/sop_model.dart';

import '../../router.dart';

class DocumentViewModel extends BaseViewModel {
  SopModel ?sopModel;
  CodeConductModel ?codeConductModel;
  KetModel ?ketModel;

  KetDocApi ?ketDocApi;

  EmployeeHandbookModel ?employeeHandbookModel;

  init(BuildContext context) async {

    setState(ViewState.Busy);

    sopModel = await api.getSopApi();

    if(sopModel?.responseCode==400){

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    setState(ViewState.Idle);
  }

  codeConductInit(BuildContext context) async{

    setState(ViewState.Busy);

    codeConductModel = await api.getCodeConductApi();

    if(codeConductModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }

    setState(ViewState.Idle);
  }


  employeeHandBookApi(BuildContext context) async{

    setState(ViewState.Busy);

    employeeHandbookModel = await api.getEmployeeHandbookApi();

    if(employeeHandbookModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }

    setState(ViewState.Idle);
  }


  documentKetInit(BuildContext context) async{

    setState(ViewState.Busy);
    ketModel = await api.getKetApi();

    if(ketModel?.responseCode==400){

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    notifyListeners();

    setState(ViewState.Idle);

  }

  getKetDoc(String ?ketId,BuildContext context) async{

    ketDocApi =  await api.getKetDocApi(ketId);

    if(ketDocApi?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


  }
}