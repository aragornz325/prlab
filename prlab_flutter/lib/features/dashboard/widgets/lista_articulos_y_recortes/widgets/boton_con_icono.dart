import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';

/// {@template BotonConIcon}
/// Boton con icono t0do,custom por el texto
/// y el icono y el color del icono
/// {@endtemplate}
class BotonConIcono extends StatelessWidget {
  /// {@macro BotonConIcon}
  const BotonConIcono({
    required this.colorIcono,
    required this.colorTexto,
    required this.textoBoton,
    required this.onTap,
    required this.icono,
    super.key,
  });

  /// texto del boton
  final String textoBoton;

  /// icono del boton
  final IconData icono;

  /// Ontap del boton
  final VoidCallback onTap;

  /// color del icono
  final Color colorIcono;

  /// color del texto
  final Color colorTexto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icono,
            size: 18.pw,
            color: colorIcono,
          ),
          SizedBox(width: 5.pw),
          Text(
            textoBoton,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.pf,
              color: colorTexto,
            ),
          ),
        ],
      ),
    );
  }
}
