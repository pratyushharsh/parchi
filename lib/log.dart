import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

const String black = '\u001b[30m';
const String blue = '\u001b[34m';
const String red = '\u001b[31m';
const String brightRed = '\u001b[31;1m';
const String green = '\u001b[32m';
const String yellow = '\u001b[33m';
const String reset = '\u001b[0m';
const String ansiLightYellow = "\u001B[93m";
const String ansiYellow = "\u001B[33m";
const String ansiYellowBackground = "\u001B[43m";
const String ansiBlue = "\u001B[34m";
const String ansiPurple = "\u001B[35m";
const String ansiCyan = "\u001B[36m";
const String ansiWhite = "\u001B[37m";
const String ansiBold = "\u001B[1m";
const String ansiUnbold = "\u001B[21m";
const String ansiUnderline = "\u001B[4m";
const String ansiStopUnderlinr = "\u001B[24m";
const String ansiBlink = "\u001B[5m";

void initRootLogger() {
  // only enable logging for debug mode
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  } else {
    Logger.root.level = Level.OFF;
  }
  hierarchicalLoggingEnabled = true;
  recordStackTraceAtLevel = Level.WARNING;

  // specify the levels for lower level loggers, if desired
  // Logger('InvoicingBlocObserver').level = Level.WARNING;

  Logger.root.onRecord.listen((record) {
    if (!kDebugMode) {
      return;
    }

    var start = reset;
    const end = reset;

    switch (record.level.name) {
      case 'INFO':
        start = ansiPurple;
        break;
      case 'WARNING':
        start = yellow;
        break;
      case 'SEVERE':
        start = brightRed;
        break;
      case 'SHOUT':
        start = red;
        break;
    }

    if (kDebugMode) {
      print(
          '$start${record.loggerName} : ${record.level} : ${record.time} : ${record.message} ${record.stackTrace != null ? '\n${record.stackTrace}' : ''}$end');
    }
  });
}

void initIsolateLogger() {
  // only enable logging for debug mode
  if (kDebugMode) {
    Logger.root.level = Level.WARNING;
  } else {
    Logger.root.level = Level.OFF;
  }
  hierarchicalLoggingEnabled = true;
  recordStackTraceAtLevel = Level.WARNING;

  // specify the levels for lower level loggers, if desired
  Logger('InvoicingBlocObserver').level = Level.WARNING;

  Logger.root.onRecord.listen((record) {
    if (!kDebugMode) {
      return;
    }

    var start = reset;
    const end = reset;

    switch (record.level.name) {
      case 'INFO':
        start = ansiPurple;
        break;
      case 'WARNING':
        start = yellow;
        break;
      case 'SEVERE':
        start = brightRed;
        break;
      case 'SHOUT':
        start = red;
        break;
    }

    if (kDebugMode) {
      print(
          '$start${record.loggerName} : ${record.level} : ${record.time} : ${record.message} ${record.stackTrace != null ? '\n${record.stackTrace}' : ''}$end');
    }
  });
}
