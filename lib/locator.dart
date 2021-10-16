
import 'package:get_it/get_it.dart';

import 'helper/navigation_service.dart';
import 'service/api/api.dart';
import 'service/shared/dialog_service.dart';
import 'service/shared/preference_service.dart';
import 'view/dashboard_page/dashboard_view_model.dart';
import 'view/document/document_view_model.dart';
import 'view/eAnnounce/eAnnounce_view_model.dart';
import 'view/eLeave/eleave_view_model.dart';
import 'view/feedback/feedback_view_model.dart';
import 'view/login_page/login_view_model.dart';
import 'view/payslip/payslip_view_model.dart';
import 'view/rewards/rewars_view_model.dart';
import 'view/training/training_view_model.dart';





GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PreferenceService());
  locator.registerLazySingleton(() => NavigationService());



 locator.registerFactory(() => LoginViewModel());
 locator.registerFactory(() => DashboardViewModel());
 locator.registerFactory(() => DocumentViewModel());
 locator.registerFactory(() => TrainingViewModel());
 locator.registerFactory(() => RewardsViewModel());
 locator.registerFactory(() => PayslipViewModel());
 locator.registerFactory(() => FeedbackViewModel());
 locator.registerFactory(() => ELeaveViewModel());
 locator.registerFactory(() => EAnnounceViewModel());



}
