import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template BotonElegirImagenPRLab}
/// Boton para elegir que logos o imágenes principales y secundarias subir
/// de la vista de edición de articulos, permitiendo subir imagen desde la web
/// o desde el celular [BotonElegirImagenPRLab].
/// {@endtemplate}
class BotonElegirImagenPRLab extends StatelessWidget {
  /// {@macro BotonElegirImagenPRLab}
  const BotonElegirImagenPRLab({
    required this.onTap,
    required this.descripcionBoton,
    this.icon = Icons.file_upload_outlined,
    super.key,
  });

  /// Es una función de devolución de llamada que se llamará
  /// cuando se toque el botón.
  final void Function()? onTap;

  /// icono para personalizar el boton para elegir una imagen
  final IconData icon;

  /// descripcion del boton o texto que indica que va a ejecutar
  final String descripcionBoton;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.pw,
          ),
          Text(
            descripcionBoton,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.pf,
              color: colores.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
