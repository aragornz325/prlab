import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template BlocListaArticulosYRecortes}
/// Muestra el nombre del articulo seleccionado y el icono de cerrar para que
/// cuando lo pulse el usuario pueda cerrar los comentarios de dicho articulo
/// {@endtemplate}
class PRNombreArticuloYIconCerrar extends StatelessWidget {
  /// {@macro PRNombreArticuloYIconCerrar}
  const PRNombreArticuloYIconCerrar({
    required this.nombreDelArticulo,
    super.key,
  });

  /// Nombre del articulo seleccionado a mostrar
  final String nombreDelArticulo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 527.pw,
          child: Text(
            nombreDelArticulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.pf,
              color: colores.secondary,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 24.pw,
            color: colores.secondary,
          ),
        ),
      ],
    );
  }
}
