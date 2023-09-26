import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/bloc/bloc_caja_comentarios.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/popup/popup_opciones_comentario.dart';

/// {@template PRComentario}
/// Tarjeta de un comentario, donde se muestra la informacion de dicho
/// comentario, el `nombre del autor` y la `fecha del comentario` u otra
/// funcionalidades como `eliminar` dicho comentario.
/// {@endtemplate}
class PRComentario extends StatelessWidget {
  /// {@macro PRComentario}
  const PRComentario({
    required this.comentario,
    super.key,
  });

  /// Modelo de comentario para sacar la informacion de dicho comentario
  /// para mostrarla
  final Comentario comentario;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: 550.pw,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: max(5.ph, 5.sh)),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    comentario.idAutor.toString(),
                  ),
                  backgroundColor: colores.secondary,
                  foregroundColor: colores.secondary,
                  maxRadius: 15.sw,
                ),
              ),
              SizedBox(width: 10.pw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 505.pw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: max(40.ph, 40.sh),
                          child: Row(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      // TODO(anyone) : reemplazar por el nombre y apellido del usuario
                                      '${comentario.textoComentario}'
                                      ' ${comentario.textoComentario}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: colores.tertiary,
                                        fontSize: 16.pf,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 5.pw),
                                    Text(
                                      // TODO(anyone) : reemplazar por la
                                      // compania del autor del comentario
                                      '(Company)',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: colores.secondary,
                                        fontSize: 12.pf,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat("dd/MM/yyyy, HH:mm").format(
                                  comentario.fechaCreacion ?? DateTime.now()),
                              style: TextStyle(
                                color: colores.secondary,
                                fontSize: 12.pf,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 20.pw),
                            IconButton(
                              onPressed: () {
                                context.read<BlocCajaComentarios>().add(
                                      BlocCajaComentariosEventoAlternarAprobacionComentario(
                                        idComentario: comentario.id ?? 0,
                                      ),
                                    );
                              },
                              icon: Icon(
                                (comentario.completado ?? false)
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                color: (comentario.completado ?? false)

                                    /// TODO(anyone): agregar color al theme
                                    ? const Color(0xff1fde00)
                                    : colores.secondary,
                              ),
                            ),
                            SizedBox(width: 10.pw),
                            PopUpOpcionesComentario(
                              idComentario: comentario.id ?? 0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 451.pw,
                    child: Text(
                      comentario.textoComentario,
                      style: TextStyle(
                        color: colores.tertiary,
                        fontSize: 12.pf,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: max(1.ph, 1.sh),

            // TODO(anyone): agregar color al theme
            color: const Color(0xffefefef),
          ),
        ],
      ),
    );
  }
}
