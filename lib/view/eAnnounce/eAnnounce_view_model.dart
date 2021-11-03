import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/acknowledge_model.dart';
import 'package:osis/model/eannounce_imge_model.dart';
import 'package:osis/model/eannounce_model.dart';
import 'package:osis/model/ennounce_pdf_model.dart';

import '../../router.dart';

class EAnnounceViewModel extends BaseViewModel{

  EAnnounceModel ?eAnnounceModel;

  EAnnouncePdfModel ?eAnnouncePdfModel;

  EAnnounceImageModel ?eAnnounceImageModel;

  AcknownledeModel? acknownledeModel;


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

  getEAnnouncePDF(String id) async {

    setState(ViewState.Busy);

    eAnnouncePdfModel = await  api.getEnnouncePdfApi(id);

    setState(ViewState.Idle);


  }

  getEAnnounceImage(String id) async {

    setState(ViewState.Busy);

    eAnnounceImageModel = await  api.getEnnounceImageApi(id);

    setState(ViewState.Idle);


  }
  acknowledge(String ?id) async{

    acknownledeModel = await api.getAcknownledApi(id);


  }

}