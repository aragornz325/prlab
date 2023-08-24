import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_administracion_contenido_evento.dart';
part 'bloc_administracion_contenido_estado.dart';

//TODO(mati): hacer documentacion
class BlocAdministracionContenido extends Bloc<
    BlocAdministracionContenidoEvento, BlocAdministracionContenidoEstado> {
  BlocAdministracionContenido()
      : super(BlocAdministracionContenidoEstadoInicial()) {
    on<BlocAdministracionContenidoEvento>((event, emit) {});
  }
}
