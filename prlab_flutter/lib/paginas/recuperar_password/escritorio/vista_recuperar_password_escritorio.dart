import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/recuperar_password/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_seccion_logo_y_eslogan.dart';

/// {@template VistaRecuperarPasswordEscritorio}
/// Vista de recuperar contraseña para escritorio o browsers.
/// {@endtemplate}
class VistaRecuperarPasswordEscritorio extends StatelessWidget {
  /// {@macro VistaRecuperarPasswordEscritorio}
  const VistaRecuperarPasswordEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FormularioDeRecuperarPassword(width: 44.5.wp),
          const SeccionLogoYEslogan(),
        ],
      ),
    );
  }
}
