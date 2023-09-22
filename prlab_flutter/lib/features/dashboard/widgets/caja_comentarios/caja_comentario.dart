import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/widgets/widgets.dart';

/// {@template PRCajaDeComentario}
/// Caja de comentario en el cual contiene la lista de los comentarios a mostrar
/// y en caso de que el usuario quiera agregar un nuevo puede y eliminar dicho
/// comentario creado por el también puede y aprobar otros comentarios.
/// {@endtemplate}
class PRCajaDeComentario extends StatefulWidget {
  /// {@macro PRCajaDeComentario}
  const PRCajaDeComentario({
    required this.nombreDelArticulo,
    required this.imagenDelAutor,
    super.key,
  });

  /// Nombre del articulo por el cual se están haciendo dichos comentarios
  final String nombreDelArticulo;

  /// imagen del autor para mostrar del usuario que va a crear el nuevo
  /// comentario
  final String imagenDelAutor;

  @override
  State<PRCajaDeComentario> createState() => _PRCajaDeComentarioState();
}

class _PRCajaDeComentarioState extends State<PRCajaDeComentario> {
  /// controller del comentario a crear por el usuario
  final controllerComentario = TextEditingController();

  /// foco del comentario a crear para despegarlo o no
  final focusDelComentario = FocusNode();

  @override
  void dispose() {
    controllerComentario.dispose();
    super.dispose();
  }

  bool estaDesplegado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 617.pw,
      height: max(685.ph, 685.sh),
      padding: EdgeInsets.symmetric(horizontal: 20.pw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PRNombreArticuloYIconCerrar(
            nombreDelArticulo: widget.nombreDelArticulo,
          ),
          SizedBox(height: max(45.ph, 45.sh)),
          PRTextfieldComentario(
            controllerComentario: controllerComentario,
            focusDelComentario: focusDelComentario,
            imagenDelAutor: '',
          ),
          SizedBox(height: max(27.ph, 27.sh)),
          if (estaDesplegado) const BotonesCancelarYPostear(),
          SizedBox(height: max(20.ph, 20.sh)),
          Divider(
            height: max(1.ph, 1.sh),
            color: const Color(0xffefefef),
          ),
          SizedBox(height: max(5.ph, 5.sh)),
          const ListaDeComentarios(),
        ],
      ),
    );
  }
}
