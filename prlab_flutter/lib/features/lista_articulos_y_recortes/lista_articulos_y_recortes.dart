import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/lista_articulos_y_recortes/widgets/widgets.dart';

class ListaArticulosYRecortes extends StatelessWidget {
  const ListaArticulosYRecortes({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return BlocProvider<BlocListaArticulosYRecortes>(
      create: (context) => BlocListaArticulosYRecortes()
        ..add(const BlocListaArticulosYRecortesEventoTraerArticulos())
        ..add(const BlocListaArticulosYRecortesEventoFiltrar()),
      child: BlocBuilder<BlocListaArticulosYRecortes,
          BlocListaArticulosYRecortesEstado>(
        builder: (context, state) {
          return Container(
            height: max(530.ph, 530.sh),
            width: 1000.pw,
            color: colores.onPrimary,
            child: Column(
              children: [
                const BotonesArticulosYRecorte(),
                Divider(color: colores.onSecondary),
                const TextFieldBusquedaFiltrado(),
                Divider(color: colores.onSecondary),
                ListaDeArticulos(articulos: state.articulos),
              ],
            ),
          );
        },
      ),
    );
  }
}
