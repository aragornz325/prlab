import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
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

                // si el index es 1 o recortes
                if (state.index == 1)
                  SizedBox(
                    height: max(400.ph, 400.sh),
                    child: Center(
                      child: Text(
                        // TODO(anyone): hacer l10n
                        'This feature is not available in this version.',
                        style: TextStyle(
                          color: colores.secondary,
                          fontSize: 15.pf,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      const TextFieldBusquedaFiltrado(),
                      Divider(color: colores.onSecondary),
                    ],
                  ),

                // si la lista de articulos no tiene elementos
                if (state.index == 0)
                  if (state.articulos.isEmpty)
                    Center(
                      child: SizedBox(
                        height: max(300.ph, 300.sh),
                        width: 200.pw,
                        child:
                            Image.asset(Assets.assets_images_nada_para_ver_png),
                      ),
                    )
                  else
                    // si la lista de articulos tiene elementos
                    ListaDeArticulos(articulos: state.articulos),
              ],
            ),
          );
        },
      ),
    );
  }
}
