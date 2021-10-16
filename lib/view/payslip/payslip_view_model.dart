import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/payslip_model.dart';
import 'package:osis/model/payslip_year_model.dart';

class PayslipViewModel extends BaseViewModel {

  PaySlipYearModel? paySlipYearModel;


  PaySlipModel? paySlipModel;

  init() async{

    setState(ViewState.Busy);

    paySlipYearModel =   await api.getPayslipYearApi();

    setState(ViewState.Idle);

  }

  paySlipInit(String ?year) async{

    setState(ViewState.Busy);

    paySlipModel = await api.getPayslipApi(year);

    setState(ViewState.Idle);

  }

}