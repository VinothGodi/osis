import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osis/router.dart';
import 'package:osis/service/shared/preference_service.dart';

import 'package:provider/provider.dart';

import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';
import 'locator.dart';
import 'service/shared/dialog_service.dart';

Future<Null> main() async {

  setupLocator();


  WidgetsFlutterBinding.ensureInitialized();


  await locator<PreferenceService>().init();

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // final PushNotificationService pushNotificationService = locator<PushNotificationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    AppStyle.setSystemUIOverlayStyle();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "Job Order",
      theme: AppStyle.appTheme,
      builder: _setupDialogManager,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }

  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        final MediaQueryData data = MediaQuery.of(context);
        return DialogManager(
          child: MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: widget,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}

