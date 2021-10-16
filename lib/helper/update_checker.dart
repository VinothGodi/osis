/*


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:smarter_vehicle/core/res/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../locator.dart';

class UpdateChecker {
  versionCheck(BuildContext context) async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final String currentVersion = info.version;





    try {


      if (int.parse(appStore.version.replaceAll(".", "")) > int.parse(currentVersion.replaceAll(".", "")) && appStore.forceUpdate) {
        String message = appStore.updateMessage;



        await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Update Required",
                style: AppTextStyle.subtitle1,
              ),
              content:
              Text(message, style: AppTextStyle.body1),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "UPDATE NOW",
                    style: AppTextStyle.button,
                  ),
                  onPressed: () async => await launch(appStore.url),
                ),
              ],
            );
          },
        );
      }
    } catch (exception, stacktrace) {
    }
  }
}*/
