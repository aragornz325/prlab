import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/dialog.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/popup/popup.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dropdown_popup.dart';

/// {@template TextFieldBusquedaFiltrado}
/// Dos componentes uno es un textfield/campo de texto y el otro es un dropdown
/// para filtrar la lista articulos, por estado o fecha
/// {@endtemplate}
class TextFieldBusquedaFiltrado extends StatefulWidget {
  /// {@macro TextFieldBusquedaFiltrado}
  const TextFieldBusquedaFiltrado({super.key});

  @override
  State<TextFieldBusquedaFiltrado> createState() =>
      _TextFieldBusquedaFiltradoState();
}

class _TextFieldBusquedaFiltradoState extends State<TextFieldBusquedaFiltrado> {
  final controllerFiltradoNombre = TextEditingController();

  @override
  void dispose() {
    controllerFiltradoNombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.ph),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 813.pw,
            height: max(50.ph, 50.sh),
            padding: EdgeInsets.symmetric(horizontal: 5.pw),
            decoration: BoxDecoration(
              color: colores.surfaceTint,
              borderRadius: BorderRadius.all(Radius.circular(10.sw)),
              border: Border.all(color: colores.outline),
            ),
            child: Center(
              child: TextFormField(
                controller: controllerFiltradoNombre,
                style: TextStyle(
                  color: colores.primary,
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (value) =>
                    context.read<BlocListaArticulosYRecortes>().add(
                          BlocListaArticulosYRecortesEventoFiltrarBuscador(
                            nombreDelArticuloAFiltrar: value,
                          ),
                        ),
                decoration: InputDecoration(
                  hintText: l10n.commonSearch,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.manage_search,
                    color: colores.secondary,
                    size: 20.pw,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.pw),
          const PopupOpcionesDeFiltrado(),
        ],
      ),
    );
  }
}
