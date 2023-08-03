import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prlab_flutter/app/app.dart';
import 'package:prlab_flutter/bootstrap.dart';

import 'package:prlab_flutter/isar/isar_service.dart';

void main() async {
  await dotenv.load(fileName: 'stg.env');

  WidgetsFlutterBinding.ensureInitialized();

  /// Se instancia el objeto de la base de datos local Isar
  final isarService = IsarService();

  await isarService.openDB();

  await bootstrap(
    () => App(
      isarService: isarService,
    ),
  );
}
