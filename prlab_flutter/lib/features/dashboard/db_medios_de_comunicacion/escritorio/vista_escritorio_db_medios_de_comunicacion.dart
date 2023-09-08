import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioDbMediosDeComunicacion}
/// Vista de escritorio de búsqueda de medios de comunicación,
/// muestra una lista de `journalists` para eventualmente
/// seleccionar en el contacto y sacar los datos del
/// periodista.
///
/// Contiene una variedad de filtros de búsqueda
/// como países, cuidades, entre otras cosas.
/// {@endtemplate}
class VistaEscritorioDbMediosDeComunicacion extends StatelessWidget {
  /// {@macro VistaEscritorioDbMediosDeComunicacion}
  const VistaEscritorioDbMediosDeComunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EncabezadoDeSeccion(
            icono: Icons.manage_search_rounded,
            titulo: l10n.pageMediaDatabaseTitle,
            descripcion: l10n.pageMediaDatabaseDescription,
          ),
          SizedBox(height: 20.ph),
          const MenuBarraHorizontal(),
          SizedBox(height: 30.ph),
          const Row(
            children: [
              FiltradorDePeriodistas(),
            ],
          ),
          SizedBox(height: 85.ph),
        ],
      ),
    );
  }
}
