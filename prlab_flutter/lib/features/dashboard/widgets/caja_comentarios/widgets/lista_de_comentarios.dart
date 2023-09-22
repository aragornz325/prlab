import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/widgets/widgets.dart';

/// {@template ListaDeComentarios}
/// Lista de los comentarios a mostrar por el articulo seleccionado
/// {@endtemplate}
class ListaDeComentarios extends StatelessWidget {
  /// {@macro ListaDeComentarios}
  const ListaDeComentarios({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 30,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => PRComentario(
          comentario: Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
          ),
        ),
      ),
    );
  }
}
