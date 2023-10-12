import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/bloc/bloc_caja_comentarios.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

//! TODO(anyone):
//! agregar este textfield al factory de los textfield
//!
/// {@template PRTextfieldComentario}
/// Muestra un avatar circular para la imagen del autor y un campo de texto
/// para ingresar el comentario. El campo de texto se puede expandir
/// para mostrar varias líneas cuando tiene el foco
/// {@endtemplate}
class PRTextfieldComentario extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(left: 10.pw),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              imagenDelAutor,
            ),
            backgroundColor: colores.secondary,
            foregroundColor: colores.secondary,
            maxRadius: 15.sw,
          ),
          SizedBox(width: 10.pw),
          BlocBuilder<BlocCajaComentarios, BlocCajaComentariosEstado>(
            builder: (context, state) {
              return AnimatedContainer(
                width: 503.pw,
                height: state.desplegarComentario
                    ? max(130.ph, 130.sh)
                    : max(50.ph, 50.sh),
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sw),
                  border: Border.all(color: colores.outlineVariant),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.pw,
                    top: state.desplegarComentario ? 6.ph : 0.ph,
                  ),
                  child: TextField(
                    focusNode: focusDelComentario
                      ..addListener(() => _focoEnElCampoDeTexto(context)),
                    maxLines: state.desplegarComentario ? 10 : 1,
                    controller: controllerComentario
                      ..addListener(() {
                        context.read<BlocCajaComentarios>().add(
                              BlocCajaComentariosEventoAgregarTextoDeComentario(
                                comentario: controllerComentario.text,
                              ),
                            );
                      }),
                    style: TextStyle(
                      color: colores.tertiary,
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: l10n.pageEditContentCommentsHintText,
                      hintStyle: TextStyle(
                        color: colores.outlineVariant,
                        fontSize: 12.pf,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// indica si el usuario esta escribiendo en el campo de texto
  void _focoEnElCampoDeTexto(BuildContext context) {
    if (!focusDelComentario.hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        context.read<BlocCajaComentarios>().add(
              BlocCajaComentariosEventoDesplegarComentario(
                deplegarComentario: focusDelComentario.hasFocus,
              ),
            );
      });
    } else {
      context.read<BlocCajaComentarios>().add(
            BlocCajaComentariosEventoDesplegarComentario(
              deplegarComentario: focusDelComentario.hasFocus,
            ),
          );
    }
  }
}
