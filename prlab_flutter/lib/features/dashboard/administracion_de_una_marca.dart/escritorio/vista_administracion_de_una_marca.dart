import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioAdministracionDeUnaMarca}
/// Vista del dashboard en la seccion de administracion de una marca
/// {@endtemplate}
class VistaEscritorioAdministracionDeUnaMarca extends StatelessWidget {
  /// {@macro VistaEscritorioAdministracionDeUnaMarca}
  const VistaEscritorioAdministracionDeUnaMarca({
    required this.nombreMarca,
    super.key,
  });

  /// Nombre de la marca a mostrar en el encabezado
  final String nombreMarca;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EncabezadoDeSeccion(
          icono: Icons.article,
          titulo: '$nombreMarca ${l10n.commonArticles.toLowerCase()}',
          descripcion: l10n.pageBrandAdministrationDescription,
        ),
        SizedBox(height: 5.ph),
        const ListaArticulosYRecortes(),
      ],
    );
  }
}
