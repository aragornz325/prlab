import 'dart:developer' as developer;
import 'dart:io';

import 'package:logging/logging.dart';

/// Configuracion inicial del logger.
void initRootLogger({
  bool debugMode = false,
  bool colores = true,
  bool timestamp = true,
}) {
  Logger.root.level = Level.ALL;

  hierarchicalLoggingEnabled = true;

  // specify the levels for lower level loggers, if desired
  // Logger('SiteInfoService').level = Level.ALL;

  Logger.root.onRecord.listen((LogRecord record) {
    String message;
    String tiempo = timestamp ? '${record.time}:' : '';
    if (colores) {
      String start = '\x1b[90m';
      const String end = '\x1b[0m';
      const String white = '\x1b[37m';

      switch (record.level.name) {
        case 'INFO':
          start = '\x1b[37m';
          break;
        case 'FINE':
          start = '\x1B[32m';
          break;
        case 'FINER':
          start = '\x1B[34m';
          break;
        case 'FINEST':
          start = '\x1B[36m';
          break;
        case 'SEVERE':
          start = '\x1b[103m\x1b[31m';
          break;
        case 'SHOUT':
          start = '\x1b[41m\x1b[93m';
          break;
      }

      message =
          '$white$tiempo$end$start [${record.level.name}]: ${record.message} $end';
    } else {
      message = '$tiempo [${record.level.name}]: ${record.message}';
    }
    if (record.error != null) {
      message += '\n${record.error}';
      if (record.stackTrace != null) {
        message += '\n${record.stackTrace}';
      }
    }
    if (debugMode) {
      developer.log(
        message,
        name: record.loggerName.padRight(25),
        level: record.level.value,
        time: record.time,
      );
    } else {
      stdout.writeln(message);
    }
  });
}
