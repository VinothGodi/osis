import 'package:flutter/cupertino.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/login_model.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';

import '../../locator.dart';
import '../../router.dart';

class LoginViewModel extends BaseViewModel{

  TextEditingController companyName = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  LoginModel ?loginModel;
  loc.Location ?location = new loc.Location();
  Position ?currentPosition;
  FocusNode companyFocus = new FocusNode();
  FocusNode userNameFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  bool ?serviceEnabled = false;
  loc.PermissionStatus ?permissionGranted;
  loc.LocationData ?locationData;

  bool isLocationEnabled = false;


  init() async{
    isLocationEnabled = await locationInit();

    await getCurrentLocation();
    notifyListeners();
  }

  submitLogin(BuildContext context) async{

    if(companyName.text.isEmpty){

      await locator<DialogService>().showDialog(description: "Fill the company name");

      return;
    }
    if(userName.text.isEmpty){

      await locator<DialogService>().showDialog(description: "Fill the user name");

      return;
    }
    if(password.text.isEmpty){
      await locator<DialogService>().showDialog(description: "Fill the password");
      return;
    }



    if(isLocationEnabled) {
      await getCurrentLocation();
    loginModel = await api.loginApi(userName.text, password.text, companyName.text, currentPosition!.latitude.toString(),
        currentPosition!.longitude.toString());


    if(loginModel?.error!=null){
      await locator<DialogService>().showDialog(description: loginModel!.error.toString());

    }
    else{
      await preferenceService.setUserData(loginModel);
      Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard,(Route<dynamic> route) => false);
    }



    }

    else{
      isLocationEnabled = await locationInit();
      await getCurrentLocation();
      notifyListeners();
    }
    //await locator<DialogService>().showDialog(description: "Please select the OB Type");
  }

  Future<bool> locationInit() async {
    bool result=false;
    serviceEnabled = await location?.serviceEnabled();
    if (serviceEnabled == false) {

      serviceEnabled = await location?.requestService();
    }
    if (serviceEnabled == true) {

      permissionGranted = await location?.requestPermission();

      if (loc.PermissionStatus.granted == await location?.hasPermission()) {
        result = true;
      }

      else
      {
        await Geolocator.openAppSettings();
        result = false;
      }
    }

    return result;
  }
  getCurrentLocation() async {
    setState(ViewState.Busy);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {

      currentPosition = position;
      notifyListeners();

    }).catchError((e) {
      print(e);
      setState(ViewState.Idle);
    });
    setState(ViewState.Idle);
  }
}