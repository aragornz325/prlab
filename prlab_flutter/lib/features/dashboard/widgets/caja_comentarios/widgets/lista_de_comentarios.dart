import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/widgets/widgets.dart';

/// {@template ListaDeComentarios}
/// Lista de los comentarios a mostrar por el articulo seleccionado
/// {@endtemplate}
class ListaDeComentarios extends StatelessWidget {
  /// {@macro ListaDeComentarios}
  const ListaDeComentarios({
    required this.comentarios,
    super.key,
  });

  /// lista de comentarios a mostrar
  final List<Comentario> comentarios;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 30,
      child: ListView.builder(
        itemCount: comentarios.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.pw),
          child: PRComentario(
            comentario: comentarios[index],
          ),
        ),
      ),
    );
  }
}
