// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template PopUpOpcionesComentario}
///
/// {@endtemplate}
class PopUpOpcionesComentario extends StatefulWidget {
  /// {@macro PopUpOpcionesComentario}
  const PopUpOpcionesComentario({
    required this.idComentario,
    super.key,
  });

  /// Id del comentario seleccionado
  final int idComentario;

  @override
  _PopUpOpcionesComentarioState createState() =>
      _PopUpOpcionesComentarioState();
}

class _PopUpOpcionesComentarioState extends State<PopUpOpcionesComentario> {
  bool estaDesplegado = false;

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
      offset: const Offset(-70, 45),
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
          child: Text(
            l10n.commonDelete,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            //TODO(anyone): agregarle funcionalidad de eliminar
            setState(() {
              estaDesplegado = false;
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
          Icons.more_vert_outlined,
          color: colores.primary,
          size: 18.pw,
        ),
      ),
    );
  }
}
