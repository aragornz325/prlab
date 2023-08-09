// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BlocRegistroState extends Equatable {
  const BlocRegistroState({
    this.terminosAceptados = false,
    this.email = '',
    this.contrasenia = '',
    this.contraseniaConfirmada = false,
  });
  final bool? terminosAceptados;
  final String email;
  final String contrasenia;
  final bool contraseniaConfirmada;
  bool? get getTerminosAceptados => terminosAceptados;

  @override
  List<Object?> get props =>
      [terminosAceptados, email, contrasenia, contraseniaConfirmada];
}

class BlocRegistroInicialState extends BlocRegistroState {
  const BlocRegistroInicialState({
    this.terminosAceptados = false,
  }) : super(terminosAceptados: terminosAceptados);

  @override
  final bool? terminosAceptados;
}

class BlocRegistroSuccessState extends BlocRegistroState {
  const BlocRegistroSuccessState({
    required this.terminosAceptados,
  }) : super(terminosAceptados: terminosAceptados);

  @override
  final bool? terminosAceptados;
}

class BlocRegistroLoadingState extends BlocRegistroState {}

class BlocRegistroErrorState extends BlocRegistroState {
  const BlocRegistroErrorState({
    required this.errorMessage,
  });

  ///mensaje de error
  final String errorMessage;
}
