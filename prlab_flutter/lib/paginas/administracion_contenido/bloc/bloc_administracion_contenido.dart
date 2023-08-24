import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bloc_administracion_contenido_evento.dart';
part 'bloc_administracion_contenido_estado.dart';

//TODO(mati): hacer documentacion
/// {@template BlocAdministracionContenido}
/// El [Bloc] que puede filtrar de distintas formas los artículos,por nombre
/// en un textfield/campo de texto o filtrar por fecha y el estado
/// de un artículo.
/// {@endtemplate}
class BlocAdministracionContenido extends Bloc<
    BlocAdministracionContenidoEvento, BlocAdministracionContenidoEstado> {
  BlocAdministracionContenido()
      : super(const BlocAdministracionContenidoEstadoInicial()) {
    on<BlocAdministracionContenidoEvento>((event, emit) {});
  }
}
