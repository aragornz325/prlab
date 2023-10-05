import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/popup/popup.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template TextFieldBusquedaFiltrado}
/// Dos componentes uno es un textfield/campo de texto y el otro es un dropdown
/// para filtrar la lista articulos, por estado o fecha
/// {@endtemplate}
class TextFieldBusquedaFiltrado extends StatefulWidget {
  /// {@macro TextFieldBusquedaFiltrado}
  const TextFieldBusquedaFiltrado({
    super.key,
    this.idMarca,
  });

  /// Id de la marca  para filtrar la marca
  final int? idMarca;

  @override
  State<TextFieldBusquedaFiltrado> createState() =>
      _TextFieldBusquedaFiltradoState();
}

class _TextFieldBusquedaFiltradoState extends State<TextFieldBusquedaFiltrado> {
  final controllerFiltradoNombre = TextEditingController();

  /// Genera una espera antes guardar la nueva data del titulo
  /// en la db para mejorar la performance.
  Timer? _debounce;

  @override
  void dispose() {
    controllerFiltradoNombre.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.ph),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 60.pw, right: 20.pw),
            child: Container(
              width: 863.pw,
              height: max(50.ph, 50.sh),
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
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();

                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      context.read<BlocListaArticulosYRecortes>().add(
                            BlocListaArticulosYRecortesEventoGuardarDatosDeFiltrado(
                              nombreDelArticuloAFiltrar: value,
                            ),
                          );
                    });
                  },
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
          ),
          SizedBox(width: 0.pw),
          PopupOpcionesDeFiltrado(idMarca: widget.idMarca),
        ],
      ),
    );
  }
}
