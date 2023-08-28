// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:prlab_server/src/web/widgets/default_page_widget.dart';
import 'package:serverpod/serverpod.dart';

/// Ruta web por defecto de Serverpod.
class RouteRoot extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async => DefaultPageWidget();
}
