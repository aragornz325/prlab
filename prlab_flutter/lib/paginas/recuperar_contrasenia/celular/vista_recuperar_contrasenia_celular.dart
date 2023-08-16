import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/widgets/widgets.dart';

/// {@template vista_recuperar_contrasenia_celular}
/// Vista de recuperar contraseña para dispositivos moviles.
/// {@endtemplate}
class VistaRecuperarContraseniaCelular extends StatelessWidget {
  /// {@macro vista_recuperar_contrasenia_celular}
  const VistaRecuperarContraseniaCelular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioDeRecuperarContrasenia(
        width: 100.wp,
      ),
    );
  }
}
