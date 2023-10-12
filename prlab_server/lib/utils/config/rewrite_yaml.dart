// ignore_for_file: always_specify_types

import 'dart:io';
import 'package:yaml_writer/yaml_writer.dart';

/// Funcion que re-escribe el archivo de configuracion YAML. Usado para hacer
/// deploys en Railway.
void rewriteConfigYaml(String mode) {
  YAMLWriter yamlWriter = YAMLWriter(allowUnquotedStrings: true);
  String yamlDoc = yamlWriter.write({
    'apiServer': {
      'port': 8080,
      'publicHost': '0.0.0.0',
      'publicPort': 8080,
      'publicScheme': 'http',
    },
    'insightsServer': {
      'port': 8081,
      'publicHost': '0.0.0.0',
      'publicPort': 8081,
      'publicScheme': 'http',
    },
    'webServer': {
      'port': Platform.environment['PORT'] ?? 80,
      'publicHost': '0.0.0.0',
      'publicPort': Platform.environment['PORT'] ?? 80,
      'publicScheme': 'http',
    },
    'database': {
      'host': mode == 'staging'
          ? 'db.vtbtqqvsbekddeaeqbdt.supabase.co'
          : 'db.vmtlouazkwsgdebqowpw.supabase.co',
      'port': 5432,
      'name': 'postgres',
      'user': 'postgres',
      'password': mode == 'staging' ? 'VdeopjSVRoiGKrKp' : 'kDhcP3szJH24THq',
    },
    'redis': {
      'enabled': false,
      'host': 'redis.private-staging.examplepod.com',
      'port': 6379,
    },
  });

  File('./config/$mode.yaml')
    ..createSync()
    ..writeAsStringSync(yamlDoc);
}
