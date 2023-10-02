import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

part 'bloc_dashboard_estado.dart';
part 'bloc_dashboard_evento.dart';

/// {@template BlocDashboard}
/// Se encarga de manejar los procesos compartidos
/// por más de una página que ocurren dentro de dashboard.
/// {@endtemplate}
class BlocDashboard extends Bloc<BlocDashboardEvento, BlocDashboardEstado> {
  /// {@macro BlocDashboard}
  BlocDashboard() : super(const BlocDashboardInicial()) {
    on<BlocDashboardEventoCrearArticulo>(_onCrearArticulo);
    on<BlocDashboardEventoTraerInformacion>(_verificarUsuarioLogueado);

    add(BlocDashboardEventoTraerInformacion());
  }

  Future<void> _onCrearArticulo(
    BlocDashboardEventoCrearArticulo event,
    Emitter<BlocDashboardEstado> emit,
  ) async {
    emit(BlocDashboardCargando.desde());
    try {
      final marca = event.marca;
      final titulo = '${marca?.nombre ?? 'New'} article';

      final controller = QuillController(
        document: Document(),
        selection: const TextSelection.collapsed(offset: 0),
      );

      final contenido = controller.document.toDelta().toJson();

      final converter = QuillDeltaToHtmlConverter(
        List.castFrom(contenido),
        ConverterOptions.forEmail(),
      );

      final contenidoHtml = converter.convert();

      final idArticulo = await client.entregableArticulo.crearArticulo(
        titulo: titulo,
        idMarca: marca?.id,
        contenido: jsonEncode(contenido),
        contenidoHtml: contenidoHtml,
      );

      emit(BlocDashboardExitoso.desde(idArticulo));
    } catch (e) {
      emit(BlocDashboardFallido.desde());
    }
  }

  /// Se encarga de verificar si el usuario está logueado
  Future<void> _verificarUsuarioLogueado(
    BlocDashboardEventoTraerInformacion event,
    Emitter<BlocDashboardEstado> emit,
  ) async {
    emit(BlocDashboardCargando.desde());
    try {
      final respuesta = await client.cliente.comprobarKyc(
        sessionManager.signedInUser?.id ?? 0,
      );

      if (!respuesta) {
        emit(BlocDashboardEstadoFaltaCompletarKyc.desde());
      } else {
        emit(BlocDashboardEstadoLogueoExitoso.desde());
      }
    } catch (e) {
      emit(BlocDashboardEstadoLogueoFallido.desde());
    }
  }
}
