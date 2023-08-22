import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/vista_escritorio_administracion_contenido.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

// TODO(mati): documentar
@RoutePage()
class PaginaAdministracionContenido extends StatelessWidget {
  // TODO(mati): documentar
  const PaginaAdministracionContenido({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullResponsiveScreen(
      desktop: VistaEscritorioAdministracionContenido(),
      // TODO(mati): hacer la vista mobile
      mobile: VistaEscritorioAdministracionContenido(),
    );
  }
}
