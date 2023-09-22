import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/popup/popup_opciones_comentario.dart';

/// {@template PRComentario}
/// Tarjeta de un comentario, donde se muestra la informacion de dicho
/// comentario, el `nombre del autor` y la `fecha del comentario` u otra
/// funcionalidades como `eliminar` dicho comentario.
/// {@endtemplate}
class PRComentario extends StatefulWidget {
  /// {@macro PRComentario}
  const PRComentario({
    required this.comentario,
    super.key,
  });

  /// Modelo de comentario para sacar la informacion de dicho comentario
  /// para mostrarla
  final Comentario comentario;

  @override
  State<PRComentario> createState() => _PRComentarioState();
}

class _PRComentarioState extends State<PRComentario> {
  bool aprobado = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: max(120.ph, 120.sh),
      width: 600.pw,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: max(5.ph, 5.sh)),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    widget.comentario.linkDeImagen,
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
                    width: 535.pw,
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
                                      '${widget.comentario.nombre} ${widget.comentario.apellido}',
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
                                      // TODO(mati): hacer varible
                                      widget.comentario.nombreDeLaCompania,
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
                                  widget.comentario.fechaDeComentarioEnviado),
                              style: TextStyle(
                                color: colores.secondary,
                                fontSize: 12.pf,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 20.pw),
                            IconButton(
                              onPressed: () {
                                // TODO(anyone): agregarle funcionalidad del
                                // bloc para que cambie de aprobado de la lista
                                // de comentario
                                setState(() {
                                  aprobado = !aprobado;
                                });
                              },
                              icon: Icon(
                                aprobado
                                    ? Icons.thumb_up_outlined
                                    : Icons.thumb_up,
                                color: aprobado
                                    ? colores.secondary
                                    : const Color(0xff1fde00),
                              ),
                            ),
                            SizedBox(width: 10.pw),
                            const PopUpOpcionesComentario(idComentario: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: max(60.pw, 60.sh),
                    width: 451.pw,
                    child: TextField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
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
  });
  final String linkDeImagen;

  final String nombre;

  final String apellido;

  final String nombreDeLaCompania;

  final DateTime fechaDeComentarioEnviado;

  final bool estaAprobado;
}
