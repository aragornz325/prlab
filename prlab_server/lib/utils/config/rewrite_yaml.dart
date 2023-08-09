import 'dart:io';
import 'package:yaml_writer/yaml_writer.dart';

void rewriteConfigYaml(String mode) {
  var yamlWriter = YAMLWriter(allowUnquotedStrings: true);
  var yamlDoc = yamlWriter.write({
    'apiServer': {
      'port': Platform.environment['PORT'] ?? 8080,
      'publicHost': '0.0.0.0',
      'publicPort': Platform.environment['PORT'] ?? 8080,
      'publicScheme': 'http',
    },
    'insightsServer': {
      'port': 8081,
      'publicHost': 'localhost',
      'publicPort': 8081,
      'publicScheme': 'http',
    },
    'webServer': {
      'port': 8082,
      'publicHost': 'localhost',
      'publicPort': 8082,
      'publicScheme': 'http',
    },
    'database': {
      'host': 'db.fytajeinqwkiuvyozibk.supabase.co',
      'port': 5432,
      'name': 'postgres',
      'user': 'postgres',
      'password': 'nWYCK59DiprYNNWc'
    },
    'redis': {
      'enabled': false,
      'host': 'redis.private-staging.examplepod.com',
      'port': 6379,
    }
  });

  File file = File('./config/$mode.yaml');
  file.createSync();
  file.writeAsStringSync(yamlDoc);
}
