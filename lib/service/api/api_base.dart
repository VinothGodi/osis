import 'dart:convert';
import 'package:http/http.dart';
import 'package:osis/model/login_model.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:osis/service/shared/preference_service.dart';

import '../../locator.dart';



class ApiBase {

  var client = new Client();
  final PreferenceService preferenceService = locator<PreferenceService>();
  // SERIALIZE & ASYNC FUNCTION
  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  Future<Response?> sendAsync(String method, String fullUrl, Object? body, {bool authentication = false,bool loginAuthorization=false}) async {
    var url = fullUrl;

    LoginModel ?loginModel = await preferenceService.getUserData();

    var requestMessage =Request(method,Uri.parse(url));
    Map<String, String> headerParams = {};
    try  {
      if (body != null) {
        if (body is String) {
          headerParams["Content-Type"] = "application/x-www-form-urlencoded";
          requestMessage.body = body;
        }
        else if (body is MultipartRequest) {
          headerParams['Accept'] = "application/json";
        }
        else {
          headerParams['Accept'] = "application/json";
          headerParams["Content-Type"] = "application/json";
          requestMessage.body = serialize(body);
        }
      }

      if (authentication) {
       headerParams['Authorization'] = "Bearer ${loginModel?.accessToken}";
      }
      if(loginAuthorization){
        headerParams['Authorization'] = "Basic XfnatLYBaDO2AKP6KfcIJg==";

      }


      requestMessage.headers.addAll(headerParams);


      Response ?response;
      try {

        if(body is MultipartRequest){
          body.headers.addAll(headerParams);
          response =  await Response.fromStream(await client.send(body));
        }
        else{
          response=  await Response.fromStream(await client.send(requestMessage));

        }
        print(response.statusCode);
        print(response.statusCode);
        print(headerParams);
      }
      catch (e) {
        print(e.toString());
        locator<DialogService>().showDialog(description: e.toString());

      }
      if(response!=null){
        print(response.body);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return response;
        }
        else if (response.statusCode >= 400) {

          return response;
          //locator<DialogService>().showDialog(description: "Something went wrong");

        }
      }
      return null;
    }
    finally{

    }

  }











}