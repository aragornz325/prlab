import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_contenido/escritorio/widgets/widgets.dart';

/// {@template VistaEscritorioAdministracionContenido}
/// es la vista de administración de contenido con la cual vemos tus artículos
/// y una lista de los artículos con la cual tenemos informacion sobre su
/// nombre, estado, ultima fecha actualizada y dos opciones de compartir
/// y de mas opciones. un boton para crear artículo con ciertas propiedades
/// {@endtemplate}
class VistaEscritorioAdministracionContenido extends StatelessWidget {
  /// {@macro VistaEscritorioAdministracionContenido}
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContenidoPrincipal(
                  descripcionArticulo:
                      'Lorem ipsum dolor sit amet consectetur. Mattis'
                      ' dolor sapien pulvinar sed.',
                ),
                SizedBox(
                  width: 1040.pw,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.ph,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            'Showing page 1 of 1 <      >',
                            // TODO(SAM): cambiar luego por widget del footer
                            // correspondiente
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.pf,
                              color: colores.secondary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.pw,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.pw,
                          ),
                          child: SizedBox(
                            height: max(40.ph, 40.sh),
                            width: 800.pw,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
