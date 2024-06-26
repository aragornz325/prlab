import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required String hostUrl,
  required String entorno,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // TODO(anyone):  Esto queda como carryover, una vez que Isar actualice la

  // version a la 4.0.0 la cual soporta web local storage,
  // cambia Hive x Isar.

  /// Se instancia el objeto de la base de datos local Isar
  // await IsarService.openDB();

  // Add cross-flavor configuration here
  await initializeServerpodClient(
    hostUrl: hostUrl,
    entorno: entorno,
  );

  runApp(
    await builder(),
  );
}

/// Enum que especifica el entorno de desarrollo a utilizar para pasarselo
/// por parametro a la funcion del initializeServerpodClient.
enum EntornosDeDesarrollo {
  staging,
  development,
  production,
}
