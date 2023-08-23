import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

// TODO(mati): hacer documentacion
class DescripcionArticle extends StatelessWidget {
  // TODO(mati): hacer documentacion
  const DescripcionArticle({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: 1000.pw,
      child: Text(
        // TODO(mati): hacer que reciba una descripcion del articulo
        'Lorem ipsum dolor sit amet consectetur. Mattis dolor sapien pulvinar sed.',
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
