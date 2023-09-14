import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/widgets.dart';
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

    return Container(
      width: 839.pw,
      height: max(508.ph, 508.sh),
      color: colores.surfaceTint,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadLogoPR(),
            ],
          ),
          Divider(
            height: 0,
          ),
          _CampoDeTextoTitulo(),
          Divider(
            height: 0,
          ),
          EditorDeDescripcionDeContenido(),
        ],
      ),
    );
  }
}

class _CampoDeTextoTitulo extends StatefulWidget {
  const _CampoDeTextoTitulo();

  @override
  State<_CampoDeTextoTitulo> createState() => _CampoDeTextoTituloState();
}

class _CampoDeTextoTituloState extends State<_CampoDeTextoTitulo> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

    return SizedBox(
      height: max(90.ph, 90.sh),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.pw,
          vertical: 15.ph,
        ),
        child: TextField(
          controller: controller
            ..addListener(() {
              context.read<BlocEditorContenido>().add(
                    BlocEditorContenidoEventoActualizarArticulo(
                      titulo: controller.text,
                    ),
                  );
            }),
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
    );
  }
}
