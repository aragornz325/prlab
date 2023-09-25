import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
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
                    comentario.linkDeImagen,
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
                                      '${comentario.nombre}'
                                      ' ${comentario.apellido}',
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
                                      comentario.nombreDeLaCompania,
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
                              DateFormat("dd/MM/yyyy, HH:mm")
                                  .format(comentario.fechaDeComentarioEnviado),
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
                                        idComentario: comentario.idComentario,
                                      ),
                                    );
                              },
                              icon: Icon(
                                comentario.estaAprobado
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                color: comentario.estaAprobado

                                    /// TODO(anyone): agregar color al theme
                                    ? const Color(0xff1fde00)
                                    : colores.secondary,
                              ),
                            ),
                            SizedBox(width: 10.pw),
                            PopUpOpcionesComentario(
                              idComentario: comentario.idComentario,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 451.pw,
                    child: Text(
                      comentario.comentario,
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

            /// TODO(anyone): agregar color al theme
            color: const Color(0xffefefef),
          ),
        ],
      ),
    );
  }
}

/// TODO(anyone): borrar es un modelo de ejemplo
class Comentario {
  const Comentario({
    required this.linkDeImagen,
    required this.nombre,
    required this.apellido,
    required this.nombreDeLaCompania,
    required this.fechaDeComentarioEnviado,
    required this.estaAprobado,
    required this.idComentario,
    required this.comentario,
  });

  final int idComentario;

  final String linkDeImagen;

  final String nombre;

  final String apellido;

  final String nombreDeLaCompania;

  final DateTime fechaDeComentarioEnviado;

  final bool estaAprobado;

  final String comentario;

  Comentario copyWith({
    int? idComentario,
    String? linkDeImagen,
    String? nombre,
    String? apellido,
    String? nombreDeLaCompania,
    DateTime? fechaDeComentarioEnviado,
    bool? estaAprobado,
    String? comentario,
  }) {
    return Comentario(
      idComentario: idComentario ?? this.idComentario,
      linkDeImagen: linkDeImagen ?? this.linkDeImagen,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      nombreDeLaCompania: nombreDeLaCompania ?? this.nombreDeLaCompania,
      fechaDeComentarioEnviado:
          fechaDeComentarioEnviado ?? this.fechaDeComentarioEnviado,
      estaAprobado: estaAprobado ?? this.estaAprobado,
      comentario: comentario ?? this.comentario,
    );
  }
}
