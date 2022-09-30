//TODO: đổi biến kReleaseMode

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as log;

class Log {
  static var logger = log.Logger(
    printer: log.PrettyPrinter(
      methodCount: 0,
      colors: false,
      printTime: true,
    ),
  );
  static var errorLogger = log.Logger(
      printer: log.PrettyPrinter(
    colors: false,
    methodCount: 8,
    errorMethodCount: 8,
  ));
  static var simpleLogger = log.Logger(printer: log.SimplePrinter());

  static i(dynamic data) {
    if (kReleaseMode) {
      return;
    } else {
      logger.i(data);
    }
  }

  static d(dynamic data) {
    if (kReleaseMode) {
      return;
    } else {
      logger.d(data);
    }
  }

  static e(String tag, dynamic data) {
    if (kReleaseMode) {
      return;
    } else {
      errorLogger.e('$tag: $data');
    }
  }

  static simple(dynamic data) {
    if (kReleaseMode) {
      return;
    } else {
      simpleLogger.i(data);
    }
  }
}
