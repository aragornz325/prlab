// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrDialogFiltrarPorStatus}
/// Es el Dialog que muestra el filtrado de los articulos por status
/// para filtrar ciertos Articulos en particular
/// {@endtemplate}
class PrDialogFiltrarPorStatus extends StatelessWidget {
  /// {@macro PrDialogFiltrarPorStatus}
  const PrDialogFiltrarPorStatus({
    required this.idMarca,
    super.key,
  });

  /// Id de la marca  para filtrar la marca
  final int? idMarca;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      context: context,
      height: max(350.ph, 350.sh),
      onTap: () {
        context.read<BlocListaArticulosYRecortes>().add(
              BlocListaArticulosYRecortesEventoFiltrar(
                sinFiltro: false,
                idMarca: idMarca,
              ),
            );
        Navigator.of(context).pop();
      },
      titulo: l10n.commonAlertDialogFilterByStatus,
      botonText: l10n.commonApply,
      content: SizedBox(
        width: 300.pw,
        child: BlocBuilder<BlocListaArticulosYRecortes,
            BlocListaArticulosYRecortesEstado>(
          builder: (context, state) {
            final listaDeEntregables = List<StatusEntregables>.from(
              state.estadoEntregables,
            );

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado: listaDeEntregables
                              .contains(StatusEntregables.draft),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            context: context,
                            estadoEntregables: StatusEntregables.draft,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          colorBorde: colores.secondary,
                          colorMarcado: colores.secondary,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonDraft,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.pw),
                    Row(
                      children: [
                        PRLabCheckbox(
                          // TODO(anyone): pasar todo esto a un enum para manejar
                          // mejor los distintos estados

                          estaMarcado: listaDeEntregables
                              .contains(StatusEntregables.feedback),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            context: context,
                            estadoEntregables: StatusEntregables.feedback,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          colorBorde: colores.onTertiary,
                          colorMarcado: colores.onTertiary,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonFeedback,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.pw),
                    Row(
                      children: [
                        PRLabCheckbox(
                          // TODO(anyone): pasar todo esto a un enum para manejar
                          // mejor los distintos estados

                          estaMarcado: listaDeEntregables
                              .contains(StatusEntregables.approved),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            context: context,
                            estadoEntregables: StatusEntregables.approved,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          colorBorde: colores.primaryContainer,
                          colorMarcado: colores.primaryContainer,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonApproved,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: max(10.ph, 10.sh)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        PRLabCheckbox(
                          // TODO(anyone): pasar todo esto a un enum para manejar
                          // mejor los distintos estados

                          estaMarcado: listaDeEntregables
                              .contains(StatusEntregables.scheduled),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            context: context,
                            estadoEntregables: StatusEntregables.scheduled,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          // TODO(anyone): Hacer color en el theme no agregado ni al figma
                          colorBorde: Colors.yellow,
                          colorMarcado: Colors.yellow,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonSchedule,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        PRLabCheckbox(
                          // TODO(anyone): pasar todo esto a un enum para manejar
                          // mejor los distintos estados
                          estaMarcado: listaDeEntregables
                              .contains(StatusEntregables.published),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            context: context,
                            estadoEntregables: StatusEntregables.published,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          colorBorde: colores.onTertiaryContainer,
                          colorMarcado: colores.onTertiaryContainer,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonPublished,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Agrega a la lista a filtrar un nuevo estado a filtrar o la quita.
  void _agregarEstadoDeEntregablesAFiltrar({
    required bool value,
    required List<StatusEntregables> lista,
    required BuildContext context,
    required StatusEntregables estadoEntregables,
  }) {
    if (value) {
      lista.add(estadoEntregables);
    } else {
      lista.remove(estadoEntregables);
    }
    context.read<BlocListaArticulosYRecortes>().add(
          BlocListaArticulosYRecortesEventoFiltradoPorEstado(
            estadoEntregables: lista,
          ),
        );
  }
}

/// {@template CustomCheckbox}
/// Check box de PRLab custom como un check box para usar
/// {@endtemplate}
class PRLabCheckbox extends StatefulWidget {
  /// {@macro CustomCheckbox}
  const PRLabCheckbox({
    required this.estaMarcado,
    required this.onChanged,
    required this.colorBorde,
    required this.colorMarcado,
    required this.colorDesmarcado,
    super.key,
  });

  /// Verifica si esta seleccionado
  final bool estaMarcado;

  /// Es el cambio en el check box Cambia el valor pasado entre true o false
  final ValueChanged<bool> onChanged;

  /// color del border
  final Color colorBorde;

  /// color al estar seleccionado
  final Color colorMarcado;

  /// color del border cuando esta no seleccionado
  final Color colorDesmarcado;

  @override
  _PRLabCheckboxState createState() => _PRLabCheckboxState();
}

class _PRLabCheckboxState extends State<PRLabCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.estaMarcado;
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Container(
        width: 20.pw,
        height: max(20.ph, 20.sh),
        decoration: BoxDecoration(
          border: Border.all(color: widget.colorBorde, width: 2),
          color: _isChecked ? widget.colorMarcado : widget.colorDesmarcado,
          borderRadius: BorderRadius.circular(2.5.sw),
        ),
        child: _isChecked
            ? Icon(
                Icons.check_outlined,
                size: 15.pw,
                color: colores.surfaceTint,
              )
            : null,
      ),
    );
  }
}
