import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/eannounce_model.dart';

import '../../router.dart';

class EAnnounceViewModel extends BaseViewModel{

  EAnnounceModel ?eAnnounceModel;


  init(BuildContext context) async{

    setState(ViewState.Busy);

    eAnnounceModel = await api.getEAnnounceApi();

    if(eAnnounceModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    setState(ViewState.Idle);

  }

}