import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/leave_detail_model.dart';

class ELeaveViewModel extends BaseViewModel {

  LeaveDetailModel ?leaveDetailModel;

  init() async{
    setState(ViewState.Busy);
    leaveDetailModel = await api.getLeaveDetailApi();

    setState(ViewState.Idle);
    notifyListeners();
  }

}