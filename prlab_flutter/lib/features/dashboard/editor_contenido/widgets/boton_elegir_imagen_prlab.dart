import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template BotonElegirImagenPRLab}
/// Boton para elegir que logos o imagenes principales y secundarias subir
/// de la vista de edicion de articulos, permitiendo subir imagen desde la web
/// o desde el celular [BotonElegirImagenPRLab].
/// {@endtemplate}
class BotonElegirImagenPRLab extends StatelessWidget {
  /// {@macro BotonElegirImagenPRLab}
  const BotonElegirImagenPRLab({
    required this.onTap,
    required this.icon,
    required this.descripcionBoton,
    super.key,
  });
  final void Function()? onTap;
  final IconData icon;
  final String descripcionBoton;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.file_upload_outlined,
            size: 24.pf,
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
