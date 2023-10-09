import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/pr_dialog_filtrar_por_autor.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/pr_dialog_filtrar_por_fecha.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/pr_dialog_filtrar_por_status.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template PopupOpcionesDeFiltrado}
/// Popup de filtrado para desplegar las opciones de filtrado ejemplo:
/// Filtrado por `Autor`, `Status` o `Fecha`,
/// {@endtemplate}
class PopupOpcionesDeFiltrado extends StatefulWidget {
  /// {@macro PopupOpcionesDeFiltrado}
  const PopupOpcionesDeFiltrado({
    super.key,
    this.idMarca,
  });

  /// Id de la marca  para filtrar la marca
  final int? idMarca;

  @override
  State<PopupOpcionesDeFiltrado> createState() =>
      _PopupOpcionesDeFiltradoState();
}

class _PopupOpcionesDeFiltradoState extends State<PopupOpcionesDeFiltrado> {
  bool _estaDesplegado = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PopupMenuButton<int>(
      tooltip: '',
      onOpened: () {
        setState(() {
          _estaDesplegado = true;
        });
      },
      onCanceled: () {
        setState(() {
          _estaDesplegado = false;
        });
      },
      offset: const Offset(0, 50),
      color: colores.surfaceTint,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sw),
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 1,
          child: SizedBox(
            width: 180.pw,
            child: Text(
              l10n.commonAll,
              style: TextStyle(
                color: colores.tertiary,
                fontSize: 14.pf,
              ),
            ),
          ),
          onTap: () {
            context.read<BlocListaArticulosYRecortes>().add(
                  BlocListaArticulosYRecortesEventoFiltrar(
                    sinFiltro: true,
                    idMarca: widget.idMarca,
                  ),
                );

            setState(() {
              _estaDesplegado = false;
            });
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 2,
          child: Text(
            l10n.commonState,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<BlocListaArticulosYRecortes>(),
                child: PrDialogFiltrarPorStatus(
                  idMarca: widget.idMarca,
                ),
              ),
            );

            setState(() {
              _estaDesplegado = false;
            });
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 3,
          child: Text(
            l10n.commonDates,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogFiltrarPorFecha(),
            );

            setState(() {
              _estaDesplegado = false;
            });
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 4,
          child: Text(
            l10n.pageContentAdministrationBarInformationAuthor,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) => const PrDialogFiltrarPorAutor(),
            );

            setState(() {
              _estaDesplegado = false;
            });
          },
        ),
      ],
      child: CircleAvatar(
        radius: 20.sw,
        backgroundColor: _estaDesplegado
            ? colores.primaryOpacidadVeinte
            : colores.surfaceTint,
        child: Icon(
          Icons.tune,
          color: colores.primary,
          size: 18.pw,
        ),
      ),
    );
  }
}
