import 'dart:convert';
import 'dart:io';

import 'package:osis/model/code_conduct_model.dart';
import 'package:osis/model/eannounce_model.dart';
import 'package:osis/model/employee_handbook_model.dart';
import 'package:osis/model/feedback_model.dart';
import 'package:osis/model/ket_doc_model.dart';
import 'package:osis/model/ket_model.dart';
import 'package:osis/model/leave_detail_model.dart';
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



  Future<dynamic> feedBackCreateApi(File? image,String feedbackDate,String feedBackType,String description) async {

    String baseUrl ="http://lmsapi.awnsys.net:88//api/efeedback/save";
    var uri = Uri.parse(baseUrl);

    var request = new http.MultipartRequest("POST", uri);
    request.fields['feedbackdate'] = feedbackDate;
    request.fields['feedbackType'] = feedBackType;
    request.fields['description'] = description;


    request.files.add(await http.MultipartFile.fromPath("feedbackImage", image!.path,));

    print(request.fields);

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    return responseBody;



  }
}