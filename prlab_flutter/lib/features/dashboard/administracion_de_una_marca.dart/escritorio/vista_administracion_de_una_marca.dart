import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/bloc/bloc_administracion_de_una_marca.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioAdministracionDeUnaMarca}
/// Vista del dashboard en la seccion de administracion de una marca
/// {@endtemplate}
class VistaEscritorioAdministracionDeUnaMarca extends StatelessWidget {
  /// {@macro VistaEscritorioAdministracionDeUnaMarca}
  const VistaEscritorioAdministracionDeUnaMarca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: max(40.ph, 40.sh)),
          BlocBuilder<BlocAdministracionDeUnaMarca,
              BlocAdministracionDeUnaMarcaEstado>(
            builder: (context, state) {
              if (state is BlocAdministracionDeUnaMarcaEstadoCargando) {
                return EncabezadoDeSeccion(
                  icono: Icons.article,
                  titulo: '',
                  descripcion: l10n.pageBrandAdministrationDescription,
                );
              }

              final titulo =
                  '${state.marca?.nombre} ${l10n.commonArticles.toLowerCase()}';

              return EncabezadoDeSeccion(
                icono: Icons.article,
                titulo: titulo,
                descripcion: l10n.pageBrandAdministrationDescription,
              );
            },
          ),
          SizedBox(height: max(5.ph, 5.sh)),
          ListaArticulosYRecortes(
            idMarca: context.read<BlocAdministracionDeUnaMarca>().state.idMarca,
          ),
        ],
      ),
    );
  }
}
