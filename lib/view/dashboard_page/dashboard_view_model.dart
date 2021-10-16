import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/images.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/dashboard_model.dart';
import 'package:osis/model/login_model.dart';

class DashboardViewModel extends BaseViewModel {
LoginModel ?loginModel;
List<DashboardModel> ?dashboardModel=[];


  init() async{

    setState(ViewState.Busy);

    loginModel = preferenceService.getUserData();

    dashboardModel?.add(new DashboardModel(Images.rewards,"Rewards"));
    dashboardModel?.add(new DashboardModel(Images.feedback,"FeedBack"));
    dashboardModel?.add(new DashboardModel(Images.eAnnounce,"eAnnounce"));
    dashboardModel?.add(new DashboardModel(Images.eLeave,"eLeave"));
    dashboardModel?.add(new DashboardModel(Images.inventory,"Inventory"));
    dashboardModel?.add(new DashboardModel(Images.document,"Document"));
    dashboardModel?.add(new DashboardModel(Images.payslip,"Payslip"));
    dashboardModel?.add(new DashboardModel(Images.training,"Training"));
    dashboardModel?.add(new DashboardModel(Images.attendance,"Attendance"));

    setState(ViewState.Idle);
  }
}