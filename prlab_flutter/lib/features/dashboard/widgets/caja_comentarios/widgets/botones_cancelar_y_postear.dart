import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/bloc/bloc_caja_comentarios.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template BotonesCancelarYPostear}
/// Botones de `cancelar` y `postear`.
/// se despliegan los botones en caso de que el usuario quiera agregar un nuevo
/// comentario. con el focus del textfield.
/// {@endtemplate}
class BotonesCancelarYPostear extends StatelessWidget {
  /// {@macro BotonesCancelarYPostear}
  const BotonesCancelarYPostear({
    required this.idArticulo,
    super.key,
  });

  /// Id del articulo para crear un nuevo comentario
  final int idArticulo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(right: 25.pw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PRBoton.esOutlined(
            onTap: () {
              //TODO(anyone): agregarle funcionalidad
            },
            texto: l10n.commonCancel,
            estaHabilitado: true,
            width: 100,
            height: max(30.ph, 30.sh),
          ),
          SizedBox(width: 20.pw),
          BlocBuilder<BlocCajaComentarios, BlocCajaComentariosEstado>(
            builder: (context, state) {
              return PRBoton(
                onTap: () {
                  if (state.comentario.isNotEmpty) {
                    context.read<BlocCajaComentarios>().add(
                          BlocCajaComentariosEventoCrearComentario(
                            idArticulo: idArticulo,
                          ),
                        );
                  }
                },
                texto: l10n.commonPost,
                estaHabilitado: state.comentario.isNotEmpty,
                width: 100,
                height: max(30.ph, 30.sh),
              );
            },
          ),
        ],
      ),
    );
  }
}
