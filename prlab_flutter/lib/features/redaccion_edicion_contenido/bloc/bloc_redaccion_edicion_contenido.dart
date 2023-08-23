import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'bloc_redaccion_edicion_contenido_estado.dart';
part 'bloc_redaccion_edicion_contenido_evento.dart';

/// {@template BlocRedaccionEdicionContenido}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocRedaccionEdicionContenido extends Bloc<
    BlocRedaccionEdicionContenidoEvento, BlocRedaccionEdicionContenidoEstado> {
  /// {@macro BlocRedaccionEdicionContenido}
  BlocRedaccionEdicionContenido()
      : super(const BlocRedaccionEdicionContenidoEstadoInicial()) {
    on<BlocRedaccionEdicionContenidoEventoInicializar>(_onInitialize);
  }

  void _onInitialize(
    BlocRedaccionEdicionContenidoEventoInicializar event,
    Emitter<BlocRedaccionEdicionContenidoEstado> emit,
  ) {}
}
