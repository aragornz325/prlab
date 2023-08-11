// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

/// Clase abstracta de bloc registro para los eventos
abstract class BlocRegistroEvento extends Equatable {
  const BlocRegistroEvento();

  @override
  List<Object> get props => [];
}

/// Evento que inicializa la variable terminosAceptados en false
class BlocRegistroEventoInicializar extends BlocRegistroEvento {}

/// Evento que invierte el valor de terminosAceptados que se inicia el false
class BlocRegistroEventoAceptarTerminos extends BlocRegistroEvento {
  const BlocRegistroEventoAceptarTerminos({
    required this.terminosAceptados,
  });
  final bool? terminosAceptados;
}

/// Evento que  verifica si el token es el correcto
class BlocRegistroEventoVerificarToken extends BlocRegistroEvento {
  const BlocRegistroEventoVerificarToken({
    required this.token,
  });
  final String token;
}

/// Evento que envia los datos y hace el registro.
class BlocRegistroEventoEnviarDatosRegistro extends BlocRegistroEvento {
  const BlocRegistroEventoEnviarDatosRegistro({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
  @override
  List<Object> get props => [
        email,
        password,
      ];
}
