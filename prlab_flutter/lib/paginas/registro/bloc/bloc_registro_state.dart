// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BlocRegistroEstado extends Equatable {
  const BlocRegistroEstado({
    this.terminosAceptados = false,
    this.email = '',
    this.password = '',
    this.passwordConfirmada = false,
  });
  final bool? terminosAceptados;
  final String email;
  final String password;
  final bool passwordConfirmada;
  bool? get getTerminosAceptados => terminosAceptados;

  @override
  List<Object?> get props =>
      [terminosAceptados, email, password, passwordConfirmada];
}

class BlocRegistroEstadoInicial extends BlocRegistroEstado {
  const BlocRegistroEstadoInicial({
    super.terminosAceptados,
    super.email,
    super.password,
  });
}

class BlocRegistroEstadoExitoso extends BlocRegistroEstado {
  const BlocRegistroEstadoExitoso({
    super.terminosAceptados,
    super.email,
    super.password,
  });
}

class BlocRegistroEstadoCargando extends BlocRegistroEstado {}

class BlocRegistroErrorState extends BlocRegistroEstado {
  const BlocRegistroErrorState({
    required this.errorMessage,
  });

  ///mensaje de error
  final String errorMessage;
}
