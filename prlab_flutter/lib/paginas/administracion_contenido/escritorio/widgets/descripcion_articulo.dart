import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

// TODO(mati): hacer documentacion
class DescripcionArticulo extends StatelessWidget {
  // TODO(mati): hacer documentacion
  const DescripcionArticulo({required this.descripcionArticulo, super.key});
  final String descripcionArticulo;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: 1000.pw,
      child: Text(
        descripcionArticulo,
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: colores.secondary,
          fontSize: 15.pf,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
