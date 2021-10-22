import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/rewards_model.dart';

import '../../router.dart';

class RewardsViewModel extends BaseViewModel{


RewardsModel ?rewardsModel;

  init(BuildContext context) async{

    setState(ViewState.Busy);

    rewardsModel = await api.getRewardAPi();

    if(rewardsModel?.responseCode==400){

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }


    setState(ViewState.Idle);

  }
}