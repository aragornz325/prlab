import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/upload_logo_pr.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template ContainerEdicionArticulo}
/// Permite la edicion del titulo, descripcion del articulo, agregar logos,
/// [ContainerEdicionArticulo].
/// {@endtemplate}
class ContainerEdicionArticulo extends StatelessWidget {
  /// {@macro ContainerEdicionArticulo}
  const ContainerEdicionArticulo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return Container(
      width: 839.pw,
      height: 508.ph,
      color: colores.onPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadLogoPR(),
            ],
          ),
          const Divider(
            height: 0,
          ),
          SizedBox(
            height: 90.ph,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.pw,
                vertical: 15.ph,
              ),
              child: TextField(
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.w500,
                  fontSize: 25.pf,
                  color: colores.secondary,
                ),
                decoration: InputDecoration(
                  hintText: l10n.pageEditContentEditArticleContainerHintTitle,
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.pf,
                    color: colores.secondary,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          SizedBox(
            height: 352.ph,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.pw,
                vertical: 15.ph,
              ),
              child: TextField(
                maxLines: 20,
                // TODO(SAM): Carryover diseño: caracteres / palabras  usandose titulo y descripcion.
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.pf,
                  color: colores.secondary,
                ),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText:
                      l10n.pageEditContentEditArticleContainerHintDescription,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.pf,
                    color: colores.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
