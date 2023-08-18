import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

// TODO(Andreas): Agregar docu.
/// {@template encabezado_de_recuperar_contrasenia}
/// Contiene título y subtítulo que aparece en
/// la parte superior del formulario de recuperar contraseña.
/// {@endtemplate}
class EncabezadoDeRecuperarContrasenia extends StatelessWidget {
  /// {@macro encabezado_de_recuperar_contrasenia}
  const EncabezadoDeRecuperarContrasenia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.pw),
          child: Text(
            // TODO(Andreas): Hablar con nico sobre problema con
            // el paquete que en la resolucion
            // de telefono no se achica lo suficiente el texto.
            l10n.commonRecoverPassword,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 40.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.ph),
        Text(
          // TODO(Andreas:
          // Hablar con nico sobre problema con el paquete que en la resolucion
          // de telefono no se achica lo suficiente el texto.
          l10n.pageRecoverPasswordSubtitle,
          style: TextStyle(
            color: colores.secondary,
            fontSize: 15.pf,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 50.ph),
      ],
    );
  }
}
