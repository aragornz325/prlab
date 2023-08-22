import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/registro/widgets/cuerpo_vista_registro_prlab.dart';

/// {@template VistaRegistroCelular}
/// Vista de celular de la pantalla registro, la cual llega a traves del mail
/// donde el usuario puede registrarse y aceptar los terminos y condiciones.
/// {@endtemplate}

class VistaRegistroCelular extends StatelessWidget {
  /// {@macro VistaRegistroCelular}
  const VistaRegistroCelular({required this.email, super.key});

  /// Email del usuario que viene desde el link que clickeo de su correo.
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //blocbuilder afuera del scaffold
      body: CuerpoVistaRegistroPRLab(
        email: email,
      ),
    );
  }
}
