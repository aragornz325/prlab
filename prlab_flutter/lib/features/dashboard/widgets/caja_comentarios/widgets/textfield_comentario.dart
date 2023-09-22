import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PRTextfieldComentario}
/// Muestra un avatar circular para la imagen del autor y un campo de texto
/// para ingresar el comentario. El campo de texto se puede expandir
/// para mostrar varias líneas cuando tiene el foco
/// {@endtemplate}
class PRTextfieldComentario extends StatefulWidget {
  /// {@macro PRTextfieldComentario}
  const PRTextfieldComentario({
    required this.imagenDelAutor,
    required this.focusDelComentario,
    required this.controllerComentario,
    super.key,
  });

  /// Imagen del autor del comentario
  final String imagenDelAutor;

  /// Foco del campo de texto para cual se expanda dicho comentario
  final FocusNode focusDelComentario;

  /// Controller del campo de texto con el cual el usuario va a ingresar el
  /// comentario
  final TextEditingController controllerComentario;

  @override
  State<PRTextfieldComentario> createState() => _PRTextfieldComentarioState();
}

class _PRTextfieldComentarioState extends State<PRTextfieldComentario> {
  bool estaDesplegado = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(
            widget.imagenDelAutor,
          ),
          backgroundColor: colores.secondary,
          foregroundColor: colores.secondary,
          maxRadius: 15.sw,
        ),
        SizedBox(width: 10.pw),
        AnimatedContainer(
          width: 513.pw,
          height: estaDesplegado ? max(130.ph, 130.sh) : max(50.ph, 50.sh),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sw),
            border: Border.all(color: colores.outlineVariant),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.pw,
              top: estaDesplegado ? 6.ph : 0.ph,
            ),
            child: TextField(
              focusNode: widget.focusDelComentario
                ..addListener(() {
                  if (widget.focusDelComentario.hasFocus) {
                    setState(() {
                      estaDesplegado = true;
                    });
                  } else {
                    setState(() {
                      estaDesplegado = false;
                    });
                  }
                }),
              maxLines: estaDesplegado ? 10 : 1,
              controller: widget.controllerComentario,
              style: TextStyle(
                color: colores.tertiary,
                fontSize: 12.pf,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                // TODO(mati): hacer l10n
                hintText: l10n.pageEditContentCommentsHintText,
                hintStyle: TextStyle(
                  color: colores.outlineVariant,
                  fontSize: 12.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
