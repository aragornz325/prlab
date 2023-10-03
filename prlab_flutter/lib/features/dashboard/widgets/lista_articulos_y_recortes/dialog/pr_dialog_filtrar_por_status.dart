// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
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
  const PrDialogFiltrarPorStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      context: context,
      height: max(350.ph, 350.sh),
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
        context
            .read<BlocListaArticulosYRecortes>()
            .add(const BlocListaArticulosYRecortesEventoFiltrar());
        // print('hola');
        // Navigator.of(context).pop();
        // Muestra el popup de esta feature estará disponible en otra version
      },
      titulo: l10n.commonAlertDialogFilterByStatus,
      botonText: l10n.commonApply,
      content: SizedBox(
        width: 300.pw,
        child: BlocBuilder<BlocListaArticulosYRecortes,
            BlocListaArticulosYRecortesEstado>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        PRLabCheckbox(
                          // TODO(anyone): pasar todo esto a un enum para manejar
                          // mejor los distintos estados
                          estaMarcado: state.borrador,
                          onChanged: (value) {
                            context.read<BlocListaArticulosYRecortes>().add(
                                  BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                                    borrador: value,
                                  ),
                                );
                          },
                          colorBorde: colores.secondary,
                          colorMarcado: colores.secondary,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          // TODO(mati): hacer l10n, pero todavia no esta del todo
                          // definido los estado a filtrar
                          'Draft',
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
                          estaMarcado: state.comentario,
                          onChanged: (value) {
                            context.read<BlocListaArticulosYRecortes>().add(
                                  BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                                    comentario: value,
                                  ),
                                );
                          },
                          colorBorde: colores.onTertiary,
                          colorMarcado: colores.onTertiary,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          // TODO(mati): hacer l10n, pero todavia no esta del todo
                          // definido los estado a filtrar
                          'Feedback',
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
                          estaMarcado: state.aprobado,
                          onChanged: (value) {
                            context.read<BlocListaArticulosYRecortes>().add(
                                  BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                                    aprobado: value,
                                  ),
                                );
                          },
                          colorBorde: colores.primaryContainer,
                          colorMarcado: colores.primaryContainer,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          // TODO(anyone): Hacer l10n, pero todavia no esta del todo
                          // definido los estado a filtrar
                          'approved',
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
                          estaMarcado: state.programado,
                          onChanged: (value) {
                            context.read<BlocListaArticulosYRecortes>().add(
                                  BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                                    programado: value,
                                  ),
                                );
                          },
                          // TODO(anyone): Hacer color en el theme no agregado ni al figma
                          colorBorde: Colors.yellow,
                          colorMarcado: Colors.yellow,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          // TODO(mati): hacer l10n, pero todavia no esta del todo
                          // definido los estado a filtrar
                          'scheduled',
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
                          estaMarcado: state.publicado,
                          onChanged: (value) {
                            context.read<BlocListaArticulosYRecortes>().add(
                                  BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                                    publicado: value,
                                  ),
                                );
                          },
                          colorBorde: colores.onTertiaryContainer,
                          colorMarcado: colores.onTertiaryContainer,
                          colorDesmarcado: colores.surfaceTint,
                        ),
                        SizedBox(width: 5.pw),
                        Text(
                          // TODO(mati): hacer l10n, pero todavia no esta del todo
                          // definido los estado a filtrar
                          'published',
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
