import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/constantes/string_constants.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

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
      final idArticulo = await client.articulo.crearArticulo(
        Articulo(
          titulo: '${event.marca} article',
          idMarca: event.marca.id,
          contenido: StringConstants.contenidoDeArticuloPorDefectoJson,
        ),
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
