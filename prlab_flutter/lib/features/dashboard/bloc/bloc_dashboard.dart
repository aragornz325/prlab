import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_client/prlab_client.dart';
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
    on<BlocDashboardCrearArticulo>(_onCrearArticulo);
  }

  Future<void> _onCrearArticulo(
    BlocDashboardCrearArticulo event,
    Emitter<BlocDashboardEstado> emit,
  ) async {
    emit(BlocDashboardCargando.desde());
    try {
      final idArticulo = await client.articulo.crearArticulo(
        Articulo(
          titulo: '${event.marca} article',
          idMarca: event.marca.id,
        ),
      );

      emit(BlocDashboardExitoso.desde(idArticulo));
    } catch (e) {
      emit(BlocDashboardFallido.desde());
    }
  }
}
