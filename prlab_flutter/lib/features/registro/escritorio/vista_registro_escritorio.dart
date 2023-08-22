import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/registro/widgets/cuerpo_vista_registro_prlab.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_seccion_logo_y_eslogan.dart';

/// {@template VistaRegistroEscritorio}
/// Vista de escritorio de la pantalla registro, la cual llega a traves
/// del mail donde el usuario puede registrarse  y aceptar los terminos
/// y condiciones.
/// {@endtemplate}
class VistaRegistroEscritorio extends StatefulWidget {
  /// {@macro VistaRegistroEscritorio}
  const VistaRegistroEscritorio({required this.email, super.key});

  final String email;

  @override
  State<VistaRegistroEscritorio> createState() =>
      _VistaRegistroEscritorioState();
}

class _VistaRegistroEscritorioState extends State<VistaRegistroEscritorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CuerpoVistaRegistroPRLab(
            email: widget.email,
          ),
          const SeccionLogoYEslogan(),
        ],
      ),
    );
  }
}
