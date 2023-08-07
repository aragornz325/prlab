import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prlab_flutter/app/app.dart';
import 'package:prlab_flutter/bootstrap.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_app.g.dart';

void main() async {
  await dotenv.load(fileName: 'stg.env');
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(
    () => FullResponsiveApp(
      child: const App(),
    ),
  );
}
