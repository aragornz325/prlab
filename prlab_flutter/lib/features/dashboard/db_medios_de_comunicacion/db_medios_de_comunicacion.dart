import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/celular/vista_celular_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/escritorio/vista_escritorio_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaDbMediosDeComunicacion}
/// Página de busqueda de medios de comunicación, muestra
/// una lista de `journalists` para eventualmente
/// seleccionar en el contacto y sacar los datos del
/// periodista.
///
/// Contiene una variedad de filtros de busqueda
/// como países, cuidades, entre otras cosas.
/// {@endtemplate}
@RoutePage()
class PaginaDbMediosDeComunicacion extends StatelessWidget {
  /// {@macro PaginaDbMediosDeComunicacion}
  const PaginaDbMediosDeComunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullResponsiveScreen(
      mobile: VistaCelularDbMediosDeComunicacion(),
      desktop: VistaEscritorioDbMediosDeComunicacion(),
    );
  }
}