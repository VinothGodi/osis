import 'dart:convert';
import 'dart:io';

import 'package:osis/model/acknowledge_model.dart';
import 'package:osis/model/code_conduct_model.dart';
import 'package:osis/model/eannounce_imge_model.dart';
import 'package:osis/model/eannounce_model.dart';
import 'package:osis/model/eleave_create_model.dart';
import 'package:osis/model/eleave_status_model.dart';
import 'package:osis/model/employee_handbook_model.dart';
import 'package:osis/model/ennounce_pdf_model.dart';
import 'package:osis/model/feedback_create_model.dart';
import 'package:osis/model/feedback_model.dart';
import 'package:osis/model/feedback_type_model.dart';
import 'package:osis/model/ket_doc_model.dart';
import 'package:osis/model/ket_model.dart';
import 'package:osis/model/leave_detail_model.dart';
import 'package:osis/model/leave_type_model.dart';
import 'package:osis/model/login_model.dart';
import 'package:osis/model/payslip_model.dart';
import 'package:osis/model/payslip_year_model.dart';
import 'package:osis/model/rewards_model.dart';
import 'package:osis/model/sop_model.dart';
import 'package:osis/model/training_development_model.dart';
import 'package:osis/model/wsq_model.dart';
import 'package:http/http.dart' as http;

import 'api_base.dart';
import 'api_method.dart';

class Api extends ApiBase {



  Future<LoginModel?> loginApi(String userName,String password,String companyCode,String latitude,String longitude) async {

    Map<String, dynamic> params = new Map();
    params['username'] = userName;
    params['password'] = password;
    params['latitude'] = latitude;
    params['longitude'] = longitude;
    params['companycode'] = companyCode;



    print(params);

    final response = await sendAsync(ApiMethod.POST, 'http://lmsapi.awnsys.net:88/api/login/Get', params,authentication: false,loginAuthorization: true);
    if (response!=null){

      return LoginModel.fromJson(json.decode(response.body));
    }
    return null;

  }



  Future<SopModel?> getSopApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/sop/get', null,authentication: true);
    if (response!=null){

      return SopModel.fromJson(json.decode(response.body));
    }
    return null;

  }



  Future<CodeConductModel?> getCodeConductApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/sop/codeofconduct', null,authentication: true);
    if (response!=null){

      return CodeConductModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<EmployeeHandbookModel?> getEmployeeHandbookApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/sop/employeehandbook', null,authentication: true);
    if (response!=null){

      return EmployeeHandbookModel.fromJson(json.decode(response.body));
    }
    return null;

  }


  Future<TrainingDevelopmentModel?> getDevelopmentAPi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/developmental/get', null,authentication: true);
    if (response!=null){

      return TrainingDevelopmentModel.fromJson(json.decode(response.body));
    }
    return null;

  }



  Future<RewardsModel?> getRewardAPi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/reward/get', null,authentication: true);
    if (response!=null){

      return RewardsModel.fromJson(json.decode(response.body));
    }
    return null;

  }





  Future<PaySlipYearModel?> getPayslipYearApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/payslip/year', null,authentication: true);
    if (response!=null){

      return PaySlipYearModel.fromJson(json.decode(response.body));
    }
    return null;

  }



  Future<PaySlipModel?> getPayslipApi(String ?year) async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/payslip/month?year=$year', null,authentication: true);
    if (response!=null){

      return PaySlipModel.fromJson(json.decode(response.body));
    }
    return null;

  }
  Future<FeedBackModel?> getFeedbackApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/efeedback/get', null,authentication: true);
    if (response!=null){

      return FeedBackModel.fromJson(json.decode(response.body));
    }
    return null;

  }
  Future<KetModel?> getKetApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/sop/employeeKET', null,authentication: true);
    if (response!=null){

      return KetModel.fromJson(json.decode(response.body));
    }
    return null;

  }


  Future<KetDocApi?> getKetDocApi(String ?ketID) async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/sop/employeeketdocument?ketcode=$ketID', null,authentication: true);
    if (response!=null){

      return KetDocApi.fromJson(json.decode(response.body));
    }
    return null;

  }


  Future<WSQModel?> getWsqApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/training/document?menuname=WSQ', null,authentication: true);
    if (response!=null){

      return WSQModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<EAnnounceModel?> getEAnnounceApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/announcements/get', null,authentication: true);
    if (response!=null){

      return EAnnounceModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<LeaveDetailModel?> getLeaveDetailApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/leave/get', null,authentication: true);
    if (response!=null){

      return LeaveDetailModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<LeaveTypeModel?> getLeaveTypeApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/leave/Getdeploymentcategory', null,authentication: true);
    if (response!=null){

      return LeaveTypeModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<FeedBackTypeModel?> getFeedbackTypeApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88/api/efeedback/getfeedbacktype', null,authentication: true);
    if (response!=null){

      return FeedBackTypeModel.fromJson(json.decode(response.body));
    }
    return null;

  }
  Future<AcknownledeModel?> getAcknownledApi(String ?id) async {


    final response = await sendAsync(ApiMethod.PUT, 'http://lmsapi.awnsys.net:88//api/announcements/save?id=$id', null,authentication: true);
    if (response!=null){

      return AcknownledeModel.fromJson(json.decode(response.body));
    }
    return null;

  }

  Future<ELeaveStatusModel?> getLeaveStatusApi() async {


    final response = await sendAsync(ApiMethod.GET, 'http://lmsapi.awnsys.net:88//api/leave/selectscheduleleave', null,authentication: true);
    if (response!=null){

      return ELeaveStatusModel.fromJson(json.decode(response.body));
    }
    return null;

  }


  Future<EAnnouncePdfModel?> getEnnouncePdfApi(String id) async {

    Map<String, dynamic> params = new Map();
    params['id'] = id;


    final response = await sendAsync(ApiMethod.POST, 'http://lmsapi.awnsys.net:88/api/announcements/PDFview', params,authentication: true);
    if (response!=null){

      return EAnnouncePdfModel.fromJson(json.decode(response.body));
    }
    return null;

  }
  Future<EAnnounceImageModel?> getEnnounceImageApi(String id) async {

    Map<String, dynamic> params = new Map();
    params['id'] = id;


    final response = await sendAsync(ApiMethod.POST, 'http://lmsapi.awnsys.net:88/api/announcements/Imageview', params,authentication: true);
    if (response!=null){

      return EAnnounceImageModel.fromJson(json.decode(response.body));
    }
    return null;

  }


  Future<FeedBackCreateModel?> feedBackCreateApi(String image,String feedbackDate,String feedBackType,String description) async {

    Map<String, dynamic> params = new Map();
    params['feedbackdate'] = feedbackDate;
    params['feedbackType'] = feedBackType;
    params['description'] = description;
    params['feedbackImage'] = image;

    final response = await sendAsync(ApiMethod.POST, 'http://lmsapi.awnsys.net:88//api/efeedback/save', params,authentication: true);
    if (response!=null){

      return FeedBackCreateModel.fromJson(json.decode(response.body));
    }
    return null;

  }



  Future<EleaveCreateModel?> eLeaveCreate(String startDate,String endDate,String reMarks, String? category) async {
    //LoginModel ?loginModel = await preferenceService.getUserData();
    Map<String, dynamic> params = new Map();
    params['startdate'] = startDate;
    params['enddate'] = endDate;
    params['description'] = reMarks;
    params['category'] = category;
    //params['companycode'] = loginModel.empcode.toString();

    final response = await sendAsync(ApiMethod.POST, 'http://lmsapi.awnsys.net:88//api/leave/saveleaverequest', params,authentication: true);
    if (response!=null){

      return EleaveCreateModel.fromJson(json.decode(response.body));
    }
    return null;

  }

}