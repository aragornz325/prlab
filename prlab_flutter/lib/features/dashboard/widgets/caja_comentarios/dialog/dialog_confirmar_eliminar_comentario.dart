import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/bloc/bloc_caja_comentarios.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

//! TODO(anyone):
//! agregarlo a los factory de los dialog se usa en otras pantallas
//!
/// {@template PaginaEditorContenido}
/// Dialog de preguntar al usuario si quiere eliminar el comentario escrito
/// {@endtemplate}
class PrDialogConfirmarEliminarComentario extends StatelessWidget {
  /// {@macro PaginaEditorContenido}
  const PrDialogConfirmarEliminarComentario({
    required this.idComentario,
    super.key,
  });

  /// Id del comentario a eliminar
  final int idComentario;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.delete(
      context: context,
      titulo: l10n.commonDelete,
      content: Column(
        children: [
          SizedBox(
            height: max(80.ph, 80.sh),
            child: Text(
              l10n.commonDialogDescriptionDelete(l10n.commonComment),
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
      onTapBotonPrimario: () => Navigator.of(context).pop(),
      onTapBotonSecundario: () => _funcionEliminar(context),
    );
  }

  /// elimina dicho comentario seleccionado
  void _funcionEliminar(BuildContext context) {
    context.read<BlocCajaComentarios>().add(
          BlocCajaComentariosEventoEliminarComentario(
            idComentario: idComentario,
          ),
        );
    Navigator.of(context).pop();
  }
}
