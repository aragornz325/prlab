import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';

class BlocRegistro extends Bloc<BlocRegistroEvento, BlocRegistroEstado> {
  BlocRegistro()
      : super(
          const BlocRegistroEstadoInicial(),
        ) {
    on<BlocRegistroEventoInicializar>(_onInicializar);
    on<BlocRegistroEventoAceptarTerminos>(_onAceptarTerminos);
    on<BlocRegistroEventoEnviarDatosRegistro>(_onEnviarDatosRegistro);
  }

  ///Evento que inicializa el bloc con el estado inicial y la variable en false.
  Future<void> _onInicializar(
    BlocRegistroEventoInicializar event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      const BlocRegistroEstadoInicial(),
    );
  }

  ///Evento que acepta (o declina) los terminos y guarda el estado del checkbox.
  Future<void> _onAceptarTerminos(
    BlocRegistroEventoAceptarTerminos event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      BlocRegistroEstadoCargando(),
    );
    final terminos = event.terminosAceptados;
    final email = state.email;
    final password = state.password;
    emit(
      BlocRegistroEstadoExitoso(
        terminosAceptados: terminos,
        email: email,
        password: password,
      ),
    );
  }

  ///Evento que inicializa el bloc con el estado inicial y la variable en false.
  Future<void> _onEnviarDatosRegistro(
    BlocRegistroEventoEnviarDatosRegistro event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      BlocRegistroEstadoCargando(),
    );
    // client.modules.auth.email.createAccountRequest(userName, email, password); //admin

    //    sebas@gmail.com
    //    sebas  /split
    //    moc.liamg@sabes /reverse

    // desloguear admin
    //   await   loguear cliente
    // await client.modules.auth.email.changePassword(); //cliente

    //TODO(sam): poner funcion de registro/ cambiar password
    // await client.modules.auth.user.client.registrarUsuario(
    //       terminosAceptados: state.terminosAceptados,
    // email: event.email,
    // password: event.password,)

    emit(
      BlocRegistroEstadoExitoso(
        terminosAceptados: state.terminosAceptados,
        email: event.email,
        password: event.password,
      ),
    );
  }
}
