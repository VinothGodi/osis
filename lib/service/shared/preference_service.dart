

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:osis/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceService {
  static const String employeeCode = "employeeCode";
  static const String employeeName = "employeeName";
  static const String token = "ime";
  static const String userData = "userData";

  late SharedPreferences pref;

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  setEmployeeId(String ?value) {
    pref.setString(employeeCode, value!);
    debugPrint("employeeCode stored successfully");
  }

  setEmployeeName(String ?value) {
    pref.setString(employeeName, value!);
    debugPrint("employeeName stored successfully");
  }
  String getEmployeeId() {
    return pref.getString(employeeCode) ?? "";
  }
  setToken(String value) {
    pref.setString(token, value);
    debugPrint("Token stored successfully");
  }

  setUserData(LoginModel ?userModel)  {  // User Profile Data
    pref.setString(userData, json.encode(userModel?.toJson()));
  }

  LoginModel ?getUserData() {  // get User Profile Data
    LoginModel userObject = pref.getString(userData)==null?new LoginModel():LoginModel.fromJson(jsonDecode(pref.getString(userData).toString()
    ));

    // ignore: unnecessary_null_comparison
    return userObject==null? null: userObject;

  }


  String getToken() {
    return pref.getString(token) ?? "";
  }

  String getEmployeeName() {
    return pref.getString(employeeName) ?? "";
  }
  clearData() async {
    pref.clear();
  }

}
