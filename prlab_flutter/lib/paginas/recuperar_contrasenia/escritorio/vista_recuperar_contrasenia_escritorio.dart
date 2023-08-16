import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/widgets/widgets.dart';

/// {@template vista_recuperar_contrasenia_escritorio}
/// Vista de recuperar contraseña para escritorio o browsers.
/// {@endtemplate}
class VistaRecuperarContraseniaEscritorio extends StatelessWidget {
  /// {@macro vista_recuperar_contrasenia_escritorio}
  const VistaRecuperarContraseniaEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FormularioDeRecuperarContrasenia(width: 44.5.wp),
          const SeccionLogoBienvenida(),
        ],
      ),
    );
  }
}
