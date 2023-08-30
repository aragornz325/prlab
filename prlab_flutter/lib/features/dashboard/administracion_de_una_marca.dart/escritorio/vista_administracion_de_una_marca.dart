import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

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

    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: Row(
        children: [
          Container(
            width: 210.pw,
            height: 100.hp,
            color: colores.primaryOpacidadCincuenta,
          ),
          SizedBox(width: 30.pw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1040.pw,
                height: 100.ph,
                color: colores.primaryOpacidadCincuenta,
              ),
              SizedBox(height: 40.ph),
              EncabezadoDeSeccion(
                icono: Icons.article,
                titulo: '$nombreMarca ${l10n.commonArticles.toLowerCase()}',
                descripcion: l10n.pageBrandAdministrationDescription,
              ),
              SizedBox(height: 5.ph),
              const ListaArticulosYRecortes(),
              SizedBox(
                width: 1040.pw,
                height: 60.ph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
