import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prlab_flutter/app/app.dart';
import 'package:prlab_flutter/bootstrap.dart';

void main() async {
  await dotenv.load(fileName: 'dev.env');
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(
    () => const App(),
  );
}
