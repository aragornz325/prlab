import 'package:logger/logger.dart';
import 'dart:io';



class PrintOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final logData = {
      'nivel': event.origin.level.name.toString(),
      'mensaje': event.origin.message,
      'host': Platform.localHostname,
    };
    print(logData);
  }
}

final loggerPrint = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
  output: MultiOutput([ConsoleOutput(), PrintOutput()]),
);
