import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PaginaEditorContenido}
/// Dialog de preguntar al usuario si quiere eliminar el articulo seleccionado
/// {@endtemplate}
class PrDialogConfirmarAlEliminarArticulo extends StatelessWidget {
  /// {@macro PaginaEditorContenido}
  const PrDialogConfirmarAlEliminarArticulo({
    required this.idArticulo,
    super.key,
  });

  /// id del articulo a eliminar
  final int idArticulo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.delete(
      height: max(300.ph, 300.sh),
      context: context,
      titulo: l10n.commonDelete,
      content: Column(
        children: [
          SizedBox(
            height: max(80.ph, 80.sh),
            child: Text(
              l10n.commonDialogDescriptionDelete(l10n.commonArticles),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colores.secondary,
                fontSize: 15.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      tituloBotonPrimario: l10n.commonBack,
      tituloBotonSecundario: l10n.commonContinue,
      onTapBotonPrimario: () {
        Navigator.of(context).pop();
      },
      onTapBotonSecundario: () {
        Navigator.of(context).pop();
        context.read<BlocListaArticulosYRecortes>().add(
              BlocListaArticulosYRecortesEventoEliminarArticulo(
                idArticulo,
              ),
            );
      },
    );
  }
}
