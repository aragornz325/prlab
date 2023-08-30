import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_administracion_de_una_marca_evento.dart';
part 'bloc_administracion_de_una_marca_estado.dart';

class BlocAdministracionDeUnaMarcaBloc extends Bloc<
    BlocAdministracionDeUnaMarcaEvent, BlocAdministracionDeUnaMarcaState> {
  BlocAdministracionDeUnaMarcaBloc()
      : super(BlocAdministracionDeUnaMarcaInitial()) {
    on<BlocAdministracionDeUnaMarcaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
