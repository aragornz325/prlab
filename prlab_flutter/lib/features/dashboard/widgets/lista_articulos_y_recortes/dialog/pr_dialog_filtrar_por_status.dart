// ignore_for_file: library_private_types_in_public_api, must_be_immutable

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
  PrDialogFiltrarPorStatus({
    required this.idMarca,
    super.key,
  });

  /// Id de la marca  para filtrar la marca
  final int? idMarca;

  List<StEntregables> listaDeEstados = [];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

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

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado:
                              listaDeEntregables.contains(StEntregables.draft),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            estadoEntregables: StEntregables.draft,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.pw),
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado: listaDeEntregables
                              .contains(StEntregables.feedback),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            estadoEntregables: StEntregables.feedback,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.pw),
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado: listaDeEntregables
                              .contains(StEntregables.approved),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            estadoEntregables: StEntregables.approved,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: max(20.ph, 20.sh)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado: listaDeEntregables
                              .contains(StEntregables.scheduled),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            estadoEntregables: StEntregables.scheduled,
                            lista: listaDeEntregables,
                            value: value,
                          ),
                          colorBorde: colores.onSurfaceVariant,
                          colorMarcado: colores.onSurfaceVariant,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          l10n.commonSchedule,
                          style: TextStyle(
                            color: colores.tertiary,
                            fontSize: 14.pf,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.pw),
                    Row(
                      children: [
                        PRLabCheckbox(
                          estaMarcado: listaDeEntregables
                              .contains(StEntregables.published),
                          onChanged: (value) =>
                              _agregarEstadoDeEntregablesAFiltrar(
                            estadoEntregables: StEntregables.published,
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
                            fontWeight: FontWeight.w400,
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
        width: max(18.ph, 18.ph),
        height: max(18.ph, 18.ph),
        decoration: BoxDecoration(
          border: Border.all(color: widget.colorBorde, width: 2),
          color: _isChecked ? widget.colorMarcado : widget.colorDesmarcado,
          borderRadius: BorderRadius.circular(2.5.sw),
        ),
        child: _isChecked
            ? Icon(
                Icons.check_outlined,
                size: 15,
                color: colores.surfaceTint,
              )
            : null,
      ),
    );
  }
}
