import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_administracion_contenido_evento.dart';
part 'bloc_administracion_contenido_estado.dart';

class BlocAdministracionContenidoBloc extends Bloc<BlocAdministracionContenidoEvent, BlocAdministracionContenidoState> {
  BlocAdministracionContenidoBloc() : super(BlocAdministracionContenidoInitial()) {
    on<BlocAdministracionContenidoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
