import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/leave_detail_model.dart';

import '../../router.dart';

class ELeaveViewModel extends BaseViewModel {

  LeaveDetailModel ?leaveDetailModel;

  init(BuildContext context) async{

    setState(ViewState.Busy);
    leaveDetailModel = await api.getLeaveDetailApi();

    if(leaveDetailModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }



    setState(ViewState.Idle);
    notifyListeners();
  }

}