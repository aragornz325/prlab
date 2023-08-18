import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/recuperar_password/widgets/widgets.dart';

/// {@template VistaRecuperarPasswordCelular}
/// Vista de recuperar contraseña para dispositivos moviles.
/// {@endtemplate}
class VistaRecuperarPasswordCelular extends StatelessWidget {
  /// {@macro VistaRecuperarPasswordCelular}
  const VistaRecuperarPasswordCelular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioDeRecuperarPassword(
        width: 100.wp,
      ),
    );
  }
}
