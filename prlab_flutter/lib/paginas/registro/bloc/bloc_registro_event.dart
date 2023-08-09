// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class BlocRegistroEvent extends Equatable {
  const BlocRegistroEvent();

  @override
  List<Object> get props => [];
}

//Evento que inicializa la variable terminosAceptados en false
class BlocRegistroInicializarEvent extends BlocRegistroEvent {}

//Evento que invierte el valor de terminosAceptados que se inicia el false
class BlocRegistroAceptarTerminosEvent extends BlocRegistroEvent {
  const BlocRegistroAceptarTerminosEvent({
    required this.terminosAceptados,
  });
  final bool? terminosAceptados;
}

//Evento que envia los datos y hace el registro.
class BlocRegistroEnviarDatosRegistrarseEvent extends BlocRegistroEvent {}
