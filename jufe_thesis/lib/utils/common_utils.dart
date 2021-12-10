import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CommonUtils {
  static Logger logger = Logger(
    printer: PrettyPrinter(),
  );
  //Used to track widget location
  static printWidgetTrack(String widgetName, {bool isError = false}) {
    if (isError) {
      logger.e('trigger event:$widgetName');
    } else {
      logger.i('trigger event:$widgetName');
    }
  }

  //Use to display data
  static printShowInfo(String info, {bool isError = false}) {
    if (isError) {
      logger.e('Show Error data output: $info');
    } else {
      logger.i('Show data output:$info');
    }
  }

  //Use to display Navigator moves
  static printShowNavigator(String pageName, bool isForward,
      {bool isError = false}) {
    if (isForward) {
      if (isError) {
        logger.e('Trying to Go ===>: $pageName');
      } else {
        logger.i('Move to =====>:$pageName');
      }
    } else {
      if (isError) {
        logger.e('<===== Trying to Go Back from: $pageName');
      } else {
        logger.i('$pageName <======= Move back from');
      }
    }
  }

  static Future navigationBarToNextPage(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => page))
        .then((value) => null);
  }
}
