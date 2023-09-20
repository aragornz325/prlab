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
    required this.titulo,
  });
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 839.pw,
      height: max(508.ph, 508.sh),
      color: colores.surfaceTint,
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
          _CampoDeTextoTitulo(titulo: titulo),
          const Divider(
            height: 0,
          ),
          const EditorDeDescripcionDeContenido(),
        ],
      ),
    );
  }
}

class _CampoDeTextoTitulo extends StatefulWidget {
  const _CampoDeTextoTitulo({required this.titulo});
  final String titulo;

  @override
  State<_CampoDeTextoTitulo> createState() => _CampoDeTextoTituloState();
}

class _CampoDeTextoTituloState extends State<_CampoDeTextoTitulo> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.titulo;
    super.initState();
  }

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
        child: Center(
          child: TextFormField(
            controller: controller
              ..addListener(() {
                context.read<BlocEditorContenido>().add(
                      BlocEditorContenidoEventoActualizarArticulo(
                        titulo: controller.text,
                      ),
                    );
              }),
            style: TextStyle(
              height: max(1.ph, 1.sh),
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
    );
  }
}
