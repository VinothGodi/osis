import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/rewards_model.dart';

class RewardsViewModel extends BaseViewModel{


RewardsModel ?rewardsModel;

  init() async{

    setState(ViewState.Busy);

    rewardsModel = await api.getRewardAPi();

    setState(ViewState.Idle);

  }
}