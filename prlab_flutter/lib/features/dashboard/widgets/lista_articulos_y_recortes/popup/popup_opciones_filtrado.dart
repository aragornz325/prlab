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
  const PopupOpcionesDeFiltrado({super.key});

  @override
  State<PopupOpcionesDeFiltrado> createState() =>
      _PopupOpcionesDeFiltradoState();
}

class _PopupOpcionesDeFiltradoState extends State<PopupOpcionesDeFiltrado> {
  bool estaDesplegado = false;

  int indexSeleccinado = 1;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PopupMenuButton<int>(
      tooltip: '',
      onOpened: () {
        setState(() {
          estaDesplegado = true;
        });
      },
      onCanceled: () {
        setState(() {
          estaDesplegado = false;
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
            showDialog<void>(
              context: context,
              builder: (context) {
                return const PrDialogFiltrarPorAutor();
              },
            );

            setState(() {
              estaDesplegado = false;
              indexSeleccinado = 1;
            });
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 2,
          child: Text(
            /// TODO(anyone): haces l10n
            'Status',
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
                child: const PrDialogFiltrarPorStatus(),
              ),
            );

            setState(() {
              estaDesplegado = false;
              indexSeleccinado = 2;
            });
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 3,
          child: Text(
            /// TODO(anyone): haces l10n
            'Dates',
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
              estaDesplegado = false;
              indexSeleccinado = 2;
            });
          },
        ),
      ],

      // boton crear artículo
      child: CircleAvatar(
        radius: 20.sw,
        backgroundColor: estaDesplegado
            ? colores.primaryOpacidadVeinte
            : colores.surfaceTint,
        child: Icon(
          indexSeleccinado == 1
              ? Icons.tune
              : indexSeleccinado == 2
                  ? Icons.filter_alt_outlined
                  : Icons.tune,
          color: colores.primary,
          size: 18.pw,
        ),
      ),
    );
  }
}
