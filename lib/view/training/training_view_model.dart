import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/training_development_model.dart';
import 'package:osis/model/wsq_model.dart';

import '../../router.dart';

class TrainingViewModel extends BaseViewModel{

  WSQModel ?wsqModel;

  TrainingDevelopmentModel ?trainingDevelopmentModel;

developmentInit(BuildContext context) async{
  setState(ViewState.Busy);

  trainingDevelopmentModel = await api.getDevelopmentAPi();

  if(trainingDevelopmentModel?.responseCode==400){
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
    return;

  }

  setState(ViewState.Idle);

}
  developmentWsq(BuildContext context) async{

    setState(ViewState.Busy);

    wsqModel= await  api.getWsqApi();

    if(wsqModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }



    notifyListeners();
    setState(ViewState.Idle);
  }
}