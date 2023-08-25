import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/administracion_contenido/escritorio/widgets/widgets.dart';

/// {@template TituloBotonCrearArticulo}
/// Título con un botón para crear un artículo.
/// {@endtemplate}
class TituloBotonCrearArticulo extends StatelessWidget {
  /// {@macro TituloBotonCrearArticulo}
  const TituloBotonCrearArticulo({
    required this.nombreArticulo,
    super.key,
  });

  /// Nombre del artículo
  final String? nombreArticulo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Row(
      children: [
        Icon(
          Icons.article_outlined,
          size: 40.pf,
          color: colores.primary,
        ),
        Text(
          // TODO(anyone): hacer que reciba el nombre del articulo o hacer l10n
          nombreArticulo ?? 'Your articles',
          style: TextStyle(
            fontSize: 30.pf,
            fontWeight: FontWeight.w600,
            color: colores.tertiary,
          ),
        ),
        const Spacer(),
        const PopUpMenuOpcionesAlCrearArticulo(),
      ],
    );
  }
}
