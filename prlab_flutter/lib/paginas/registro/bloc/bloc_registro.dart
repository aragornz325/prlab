import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';

class BlocRegistro extends Bloc<BlocRegistroEvent, BlocRegistroState> {
  BlocRegistro()
      : super(
          const BlocRegistroInicialState(),
        ) {
    on<BlocRegistroInicializarEvent>(_onInicializar);

    on<BlocRegistroAceptarTerminosEvent>(_onAceptarTerminos);
  }
}

///Evento que inicializa el bloc con el estado inicial y la variable en false.
Future<void> _onInicializar(
  BlocRegistroInicializarEvent event,
  Emitter<BlocRegistroState> emit,
) async {
  emit(
    const BlocRegistroInicialState(),
  );
}

FutureOr<void> _onAceptarTerminos(
  BlocRegistroAceptarTerminosEvent event,
  Emitter<BlocRegistroState> emit,
) async {
  emit(
    BlocRegistroLoadingState(),
  );
  final terminos = event.terminosAceptados;

  emit(
    BlocRegistroSuccessState(
      terminosAceptados: terminos,
    ),
  );
}
