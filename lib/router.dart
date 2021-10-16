import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:osis/view/document/document_dashboard.dart';
import 'package:osis/widgets/splash_screen.dart';

import 'service/shared/network_check.dart';
import 'view/dashboard_page/dashboard_page.dart';
import 'view/document/document_code_conduct.dart';
import 'view/document/document_employee_handbook.dart';
import 'view/document/document_ket.dart';
import 'view/document/document_sop.dart';
import 'view/eAnnounce/eAnnounce_page.dart';
import 'view/eLeave/eleave_page.dart';
import 'view/feedback/feedback_page.dart';
import 'view/login_page/login_page.dart';
import 'view/payslip/payslip_dashboard.dart';
import 'view/payslip/payslip_page.dart';
import 'view/rewards/rewards_page.dart';
import 'view/training/training_dashboard.dart';
import 'view/training/training_developmental.dart';
import 'view/training/training_wsq.dart';




const String initialRoute = "/";

class Routes {
  static const String splash = "/";
  static const String dashboard = "dashboard";
  static const String login = "login";
  static const String no_network = "no_network";
  static const String authentication = "authentication";
  static const String jobOrderDetail = "JobOrderDetail";
  static const String documentDashboard = "documentDashboard";
  static const String documentSop = "documentSop";
  static const String documentCodeConduct = "documentCodeConduct";
  static const String documentEmployeeHandbook = "documentEmployeeHandbook";
  static const String trainingDashboard = "trainingDashboard";
  static const String trainingDevelopmental = "trainingDevelopmental";
  static const String rewardsPage = "rewardsPage";
  static const String paySlipDashboard = "paySlipDashboard";
  static const String paySlipPage = "paySlipPage";
  static const String feedBackPage = "feedBackPage";
  static const String eLeavePage = "ELeavePage";
  static const String documentKet = "documentKet";
  static const String trainingWSQ = "trainingWSQ";
  static const String eAnnouncePage = "eAnnouncePage";



}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.no_network:
        return MaterialPageRoute(
            builder: (_) => NetworkDialog());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => LoginPage());

      case Routes.dashboard:
        return MaterialPageRoute(
            builder: (_) => DashBoardPage());
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => SplashScreen());

      case Routes.documentDashboard:
        return MaterialPageRoute(
            builder: (_) => DocumentDashboard());

      case Routes.documentSop:
        return MaterialPageRoute(
            builder: (_) => DocumentSop());

      case Routes.documentCodeConduct:
        return MaterialPageRoute(
            builder: (_) => DocumentCodeConduct());


      case Routes.documentEmployeeHandbook:
        return MaterialPageRoute(
            builder: (_) => DocumentEmployeeHandbook());


      case Routes.trainingDashboard:
        return MaterialPageRoute(
            builder: (_) => TrainingDashboard());


      case Routes.trainingDevelopmental:
        return MaterialPageRoute(
            builder: (_) => TrainingDevelopmental());

      case Routes.rewardsPage:
        return MaterialPageRoute(
            builder: (_) => RewardsPage());

      case Routes.paySlipDashboard:
        return MaterialPageRoute(
            builder: (_) => PaySlipDashboard());

      case Routes.feedBackPage:
        return MaterialPageRoute(
            builder: (_) => FeedBackPage());


      case Routes.eLeavePage:
        return MaterialPageRoute(
            builder: (_) => ELeavePage());

      case Routes.documentKet:
        return MaterialPageRoute(
            builder: (_) => DocumentKet());
      case Routes.trainingWSQ:
        return MaterialPageRoute(
            builder: (_) => TrainingWSQ());

      case Routes.eAnnouncePage:
        return MaterialPageRoute(
            builder: (_) => EAnnouncePage());

      case Routes.paySlipPage:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => PaySlipPage(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

/// NoTransitionRoute
/// Custom route which has no transitions
class NoTransitionRoute<T> extends MaterialPageRoute<T> {
  NoTransitionRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

/// NoPushTransitionRoute
/// Custom route which has no transition when pushed, but has a pop animation
class NoPushTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPushTransitionRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is popping
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

/// NoPopTransitionRoute
/// Custom route which has no transition when popped, but has a push animation
class NoPopTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPopTransitionRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is pushing
    if (animation.status == AnimationStatus.forward) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

class RouteUtils {
  static RoutePredicate withNameLike(String name) {
    return (Route<dynamic> route) {
      return !route.willHandlePopInternally &&
          route is ModalRoute &&
          route.settings.name != null &&
          route.settings.name!.contains(name);
    };
  }
}