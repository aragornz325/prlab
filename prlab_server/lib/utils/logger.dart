import 'dart:io';

import 'package:logger/logger.dart';

/// Clase de logger que imprime el log por pantalla.
class PrintOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    // ignore: always_specify_types
    final Map<String, dynamic> logData = {
      'nivel': event.origin.level.name,
      'mensaje': event.origin.message,
      'host': Platform.localHostname,
    };
    print(logData);
  }
}

/// Logger para imprimir por consola.
final Logger loggerPrint = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: true,
  ),
  // ignore: always_specify_types
  output: MultiOutput([ConsoleOutput(), PrintOutput()]),
);
