import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/popups/popups.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/caja_comentario.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PRFooter}
/// Footer de la vista de editor contenido para abrir los comentarios
/// [VistaEditorContenidoEscritorio].
/// {@endtemplate}
class PRFooter extends StatelessWidget {
  /// {@macro PRFooter}
  const PRFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
      builder: (context, state) {
        final articulo = state.articulo;
        if (articulo != null) {
          return SizedBox(
            height: max(50.ph, 50.sh),
            width: 1000.pw,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // TODO(anyone): agregarle funcionalidad
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'State',
                        style: TextStyle(
                          fontSize: 15.pf,
                          fontWeight: FontWeight.w400,
                          color: colores.secondary,
                        ),
                      ),
                      SizedBox(width: 5.pw),
                      Container(
                        width: 80.pw,
                        height: max(30.ph, 30.sh),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colores.surfaceTint,
                        ),
                        child: Container(
                          width: 80.pw,
                          height: max(30.ph, 30.sh),
                          decoration: BoxDecoration(
                            color: colores.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.sw),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              state.articulo!.idStatus.toString(),
                              style: TextStyle(
                                color: colores.background,
                                fontSize: 15.pf,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.pw),
                VerticalDivider(
                  color: colores.outline,
                  width: max(1.pw, 1.sw),
                ),
                SizedBox(width: 10.pw),
                InkWell(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return SlideTransition(
                          position: Tween(
                            begin: Offset(1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(animation),
                          child: child,
                        );
                      },
                      pageBuilder: (
                        BuildContext context,
                        Animation<dynamic> animation,
                        Animation<dynamic> secondaryAnimation,
                      ) {
                        return Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: 617.pw,
                              child: PRCajaDeComentario(
                                idArticulo: state.articulo!.id ?? 0,
                                nombreDelArticulo: state.articulo!.titulo,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.commonComment,
                        style: TextStyle(
                          fontSize: 15.pf,
                          color: colores.secondary,
                        ),
                      ),
                      SizedBox(width: 5.pw),
                      Container(
                        width: 25.sw,
                        height: 25.sh,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colores.surfaceTint,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            //  TODO(anyone): agregarle la cantidad de notificaciones
                            '1',
                            style: TextStyle(
                              color: colores.onTertiaryContainer,
                              fontSize: 13.pf,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const PopUpMenuOpcionesPublicar(),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
