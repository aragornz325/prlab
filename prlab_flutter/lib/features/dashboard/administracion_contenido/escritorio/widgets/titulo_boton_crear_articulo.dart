import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_contenido/escritorio/popup/popup_menu_crear_articulo.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

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

    final l10n = context.l10n;

    return Row(
      children: [
        Icon(
          Icons.article_outlined,
          size: 40.pw,
          color: colores.primary,
        ),
        SizedBox(
          width: 10.pw,
        ),
        Text(
          nombreArticulo ?? l10n.pageContentAdministrationTitleYourArticle,
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
