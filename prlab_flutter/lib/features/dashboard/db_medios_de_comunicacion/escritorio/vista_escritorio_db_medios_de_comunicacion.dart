import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/encabezado_de_seccion.dart';

class VistaEscritorioDbMediosDeComunicacion extends StatelessWidget {
  const VistaEscritorioDbMediosDeComunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EncabezadoDeSeccion(
          icono: Icons.manage_search_rounded,
          titulo: l10n.pageMediaDatabaseTitle,
          descripcion: l10n.pageMediaDatabaseDescription,
        ),
        SizedBox(height: 20.pw),
        const MenuBarraHorizontal(),
        SizedBox(height: 30.pw),
        const Row(
          children: [
            FiltrosDeJournalists(),
          ],
        ),
      ],
    );
  }
}
