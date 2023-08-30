import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'bloc_editor_contenido_estado.dart';
part 'bloc_editor_contenido_evento.dart';

/// {@template BlocEditorContenido}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocEditorContenido
    extends Bloc<BlocEditorContenidoEvento, BlocEditorContenidoEstado> {
  /// {@macro BlocEditorContenido}
  BlocEditorContenido() : super(const BlocEditorContenidoEstadoInicial()) {
    on<BlocEditorContenidoEventoInicializar>(_onInitialize);
  }

  void _onInitialize(
    BlocEditorContenidoEventoInicializar event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) {}
}
