import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/eannounce_model.dart';

class EAnnounceViewModel extends BaseViewModel{

  EAnnounceModel ?eAnnounceModel;


  init() async{

    setState(ViewState.Busy);

    eAnnounceModel = await api.getEAnnounceApi();
    setState(ViewState.Idle);

  }

}