// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class BlocRegistroEvent extends Equatable {
  const BlocRegistroEvent();

  @override
  List<Object> get props => [];
}

//Evento que inicializa la variable terminosAceptados en false
class BlocRegistroInicializarEvent extends BlocRegistroEvent {}

//Evento que invierte el valor de terminosAceptados
class BlocRegistroActivarDesactivarBotonEvent extends BlocRegistroEvent {
  const BlocRegistroActivarDesactivarBotonEvent({
    required this.terminosAceptados,
  });
  final bool? terminosAceptados;
}
