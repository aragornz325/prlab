import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class VistaEscritorioAdministracionContenido extends StatelessWidget {
// TODO(mati): hacer documentacion
  const VistaEscritorioAdministracionContenido({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO(anyone): cambiar por el drawer
            SizedBox(width: 210.pw, height: 100.hp),
            SizedBox(width: 30.pw, height: 100.hp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO(anyone): cambiar por el appbar
                SizedBox(height: max(100.ph, 100.sh), width: 1000.pw),
                const ContenidoPrincipal(
                  descripcionArticulo:
                      'Lorem ipsum dolor sit amet consectetur. Mattis'
                      ' dolor sapien pulvinar sed.',
                ),
                // TODO(anyone): cambiar por el banner de abajo
                SizedBox(height: max(90.ph, 90.sh), width: 1000.pw),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
