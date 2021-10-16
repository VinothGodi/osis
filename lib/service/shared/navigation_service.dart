import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;

class NavigationService {
  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  Future<dynamic> pushNamed(String routeName, { Object ?arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {required Object arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> popAllAndPushNamed(
    String routeName, {
    required Object arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> popUntilAndPushNamed(
      String routeName, String popRouteUntil, {
        required Object arguments,
      }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(popRouteUntil),
      arguments: arguments,
    );
  }

  void pop({returnValue}) {
    navigatorKey.currentState!.pop(returnValue);
  }
}