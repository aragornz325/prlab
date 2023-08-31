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
class VistaEscritorioAdministracionDeUnaMarca extends StatefulWidget {
  /// {@macro VistaEscritorioAdministracionDeUnaMarca}
  const VistaEscritorioAdministracionDeUnaMarca({
    super.key,
  });

  @override
  State<VistaEscritorioAdministracionDeUnaMarca> createState() =>
      _VistaEscritorioAdministracionDeUnaMarcaState();
}

class _VistaEscritorioAdministracionDeUnaMarcaState
    extends State<VistaEscritorioAdministracionDeUnaMarca> {
  @override
  void initState() {
    context
        .read<BlocAdministracionDeUnaMarca>()
        .add(BlocAdministracionDeUnaMarcaEventoInicializar());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.ph),
          BlocBuilder<BlocAdministracionDeUnaMarca,
              BlocAdministracionDeUnaMarcaEstado>(
            builder: (context, state) {
              final titulo =
                  '${state.marca?.nombre} ${l10n.commonArticles.toLowerCase()}';

              return EncabezadoDeSeccion(
                icono: Icons.article,
                titulo: titulo,
                descripcion: l10n.pageBrandAdministrationDescription,
              );
            },
          ),
          SizedBox(height: 5.ph),
          const ListaArticulosYRecortes(),
        ],
      ),
    );
  }
}
