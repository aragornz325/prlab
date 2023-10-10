// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extension_estados_articulos.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template }
/// Es el Dialog que muestra el filtrado de los articulos por status
/// para filtrar ciertos Articulos en particular
/// {@endtemplate}
class PrDialogFiltrarPorEstado extends StatelessWidget {
  /// {@macro PrDialogFiltrarPorEstado}
  PrDialogFiltrarPorEstado({
    required this.idMarca,
    super.key,
  });

  /// Id de la marca  para filtrar la marca
  final int? idMarca;

  /// lista de los estados para hacer el filtrado
  List<StEntregables> listaDeEstados = [];

  /// es un getter sacando solamente el todos para que no se cree un componente
  /// con ese estado.
  List<StEntregables> get valores =>
      StEntregables.values.where((e) => e != StEntregables.todos).toList();

  /// Agrega a la lista a filtrar un nuevo estado a filtrar o la quita.
  void _agregarEstadoDeEntregablesAFiltrar({
    required bool value,
    required List<StEntregables> lista,
    required StEntregables estadoEntregables,
  }) {
    if (value) {
      lista.add(estadoEntregables);
    } else {
      lista.remove(estadoEntregables);
    }
    listaDeEstados = lista;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.informacion(
      context: context,
      onTap: () {
        context.read<BlocListaArticulosYRecortes>().add(
              BlocListaArticulosYRecortesEventoGuardarDatosDeFiltrado(
                estadoEntregables: listaDeEstados,
              ),
            );
        Navigator.pop(context);
      },
      titulo: l10n.commonAlertDialogFilterByStatus,
      botonText: l10n.commonApply,
      content: SizedBox(
        child: BlocBuilder<BlocListaArticulosYRecortes,
            BlocListaArticulosYRecortesEstado>(
          builder: (context, state) {
            final listaDeEntregables = List<StEntregables>.from(
              state.estadoEntregables,
            );

            return Center(
              child: SizedBox(
                width: 300.pw,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ...valores.map(
                      (e) => CheckBoxYEtiquetaDeEstado(
                        estado: e,
                        etiqueta: e.getEtiqueta(l10n),
                        colorCheckBox: e.getColor(context),
                        listaDeEntregables: listaDeEntregables,
                        onChanged: (value) =>
                            _agregarEstadoDeEntregablesAFiltrar(
                          estadoEntregables: e,
                          lista: listaDeEntregables,
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
