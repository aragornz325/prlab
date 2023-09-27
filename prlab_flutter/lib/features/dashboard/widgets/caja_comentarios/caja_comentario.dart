import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/bloc/bloc_caja_comentarios.dart';
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
    required this.idArticulo,
    super.key,
  });

  /// Nombre del articulo por el cual se están haciendo dichos comentarios
  final String nombreDelArticulo;

  /// id del articulo con el cual leer los comentarios
  final int idArticulo;

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
    final colores = context.colores;
    return BlocProvider(
      create: (context) => BlocCajaComentarios()
        ..add(
          BlocCajaComentariosEventoTraerComentarios(
            idArticulo: widget.idArticulo,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: colores.background,
          width: 617.pw,
          margin: EdgeInsets.only(
            top: max(100.ph, 100.sh),
            bottom: max(20.ph, 20.sh),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.pw,
            vertical: max(10.ph, 10.sh),
          ),
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
              BlocConsumer<BlocCajaComentarios, BlocCajaComentariosEstado>(
                listener: (context, state) {
                  if (state
                      is BlocCajaComentariosEstadoComentarioCreadoExitosamente) {
                    controllerComentario.clear();
                  }
                },
                builder: (context, state) {
                  if (state.desplegarComentario) {
                    return BotonesCancelarYPostear(
                      idArticulo: widget.idArticulo,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: max(20.ph, 20.sh)),
              Divider(
                height: max(1.ph, 1.sh),

                /// TODO(anyone): agregar color al theme
                color: const Color(0xffefefef),
              ),
              SizedBox(height: max(5.ph, 5.sh)),
              BlocBuilder<BlocCajaComentarios, BlocCajaComentariosEstado>(
                builder: (context, state) {
                  if (state is BlocCajaComentariosEstadoCargando) {
                    return const Expanded(
                      flex: 30,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return ListaDeComentarios(
                    comentarios: state.comentarios,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
