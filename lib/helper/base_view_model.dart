import 'package:flutter/cupertino.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/service/api/api.dart';
import 'package:osis/service/shared/dialog_service.dart';
import 'package:osis/service/shared/preference_service.dart';



import '../locator.dart';
import 'navigation_service.dart';

class BaseViewModel extends ChangeNotifier {

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  final Api _api = locator<Api>();
  final PreferenceService _preferenceService = locator<PreferenceService>();
  final DialogService _dialogService = locator<DialogService>();



  final NavigationService _navigationService = locator<NavigationService>();


  Api get api => _api;

  PreferenceService get preferenceService => _preferenceService;

  NavigationService get navigationService => _navigationService;


  DialogService get dialogService => _dialogService;







}