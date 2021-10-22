import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/payslip_model.dart';
import 'package:osis/model/payslip_year_model.dart';

import '../../router.dart';

class PayslipViewModel extends BaseViewModel {

  PaySlipYearModel? paySlipYearModel;


  PaySlipModel? paySlipModel;

  init(BuildContext context) async{

    setState(ViewState.Busy);

    paySlipYearModel =   await api.getPayslipYearApi();

    if(paySlipYearModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }



    setState(ViewState.Idle);

  }

  paySlipInit(String ?year, BuildContext context) async{

    setState(ViewState.Busy);

    paySlipModel = await api.getPayslipApi(year);

    if(paySlipModel?.responseCode==400){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      return;

    }



    setState(ViewState.Idle);

  }

}