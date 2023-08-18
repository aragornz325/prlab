// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

/// {@template BlocRegistroEvento}
/// Maneja el formulario de información del usuario
/// en el momento que el usuario se esta  registrando.
/// {@endtemplate}
abstract class BlocRegistroEvento extends Equatable {
  /// {@macro BlocRegistroEvento}
  const BlocRegistroEvento();

  @override
  List<Object> get props => [];
}

/// Invierte el valor de terminosAceptados que se inicia el false
class BlocRegistroEventoAceptarTerminos extends BlocRegistroEvento {
  /// {@macro BlocRegistroEventoAceptarTerminos}
  const BlocRegistroEventoAceptarTerminos({
    required this.terminosAceptados,
  });

  final bool terminosAceptados;
}

/// Verifica si el token es el correcto y agrega el email correspondiente
/// al estado.
class BlocRegistroEventoVerificarToken extends BlocRegistroEvento {
  /// {@macro BlocRegistroEventoVerificarToken}
  const BlocRegistroEventoVerificarToken({
    required this.token,
  });

  final String token;
}

/// Envia los datos y hace el registro.
class BlocRegistroEventoEnviarDatosRegistro extends BlocRegistroEvento {
  /// {@macro BlocRegistroEventoEnviarDatosRegistro}
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

/// Recolecta los valores que se van completando
/// en el formulario cada vez que se actualiza.
class BlocRegistroEventoRecolectarDatosRegistro extends BlocRegistroEvento {
  /// {@macro BlocRegistroEventoRecolectarDatosRegistro}
  const BlocRegistroEventoRecolectarDatosRegistro({
    this.email,
    this.password,
    this.confirmarPassword,
    this.terminosAceptados,
  });

  final String? email;
  final String? password;
  final String? confirmarPassword;
  final bool? terminosAceptados;
}
