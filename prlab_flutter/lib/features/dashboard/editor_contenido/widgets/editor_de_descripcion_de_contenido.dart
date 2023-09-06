import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template  EditorDeDescripcionDeContenido}
/// Contiene los elementos para la edición
/// de la descripción de un 'PRArticulo', esta seteado con
/// el package de appflowy_editor y customizado para que se
/// asemeje a el tema de la aplicación.
/// {@endtemplate}
class EditorDeDescripcionDeContenido extends StatefulWidget {
  /// {@macro EditorDeDescripcionDeContenido}
  const EditorDeDescripcionDeContenido({
    super.key,
  });

  @override
  State<EditorDeDescripcionDeContenido> createState() =>
      _EditorDeDescripcionDeContenidoState();
}

class _EditorDeDescripcionDeContenidoState
    extends State<EditorDeDescripcionDeContenido> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: 352.ph,
      child: StreamBuilder<String>(
        // TODO(Andreas): Una vez que este el endpoint del back,
        // consumir el json desde el estado retroalimentado por el evento.
        // stream: Stream.value(bloc.state.descripcionDeArticulo),
        stream: Stream<String>.value(
          jsonEncode(
            EditorState.blank().document.toJson(),
          ),
        ),
        builder: (context, snapshot) {
          final estaConectado =
              snapshot.connectionState == ConnectionState.done;

          if (!snapshot.hasData && !estaConectado) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final editorState = EditorState(
            document: Document.fromJson(
              Map<String, Object>.from(
                json.decode(snapshot.data!) as Map,
              ),
            ),
          );

          editorState.logConfiguration
            ..handler = debugPrint
            ..level = LogLevel.off;

          return FloatingToolbar(
            items: [
              paragraphItem,
              ...headingItems,
              ...markdownFormatItems,
              quoteItem,
              bulletedListItem,
              numberedListItem,
              linkItem,
              buildTextColorItem(),
              buildHighlightColorItem(),
              ...textDirectionItems,
            ],
            editorState: editorState,
            scrollController: scrollController,
            style: FloatingToolbarStyle(
              backgroundColor: colores.outlineVariant,
              toolbarActiveColor: colores.primary,
            ),
            child: _ContenedorDeDescripcionDeContenido(
              editorState: editorState,
              scrollController: scrollController,
            ),
          );
        },
      ),
    );
  }
}

/// {@template  ContenedorDeDescripcionDeContenido}
/// Contiene el lienzo de la descripción, aca se edita
/// la descripción como tal, se puede editar los tamaños
/// que ocupa el componente en si y manejar el scroll del mismo.
/// {@endtemplate}
class _ContenedorDeDescripcionDeContenido extends StatelessWidget {
  /// {@macro  ContenedorDeDescripcionDeContenido}
  const _ContenedorDeDescripcionDeContenido({
    required this.editorState,
    required this.scrollController,
  });

  final EditorState editorState;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final customBlockComponentBuilders = {
      ...standardBlockComponentBuilderMap,
    };

    return AppFlowyEditor(
      editorState: editorState,
      scrollController: scrollController,
      blockComponentBuilders: customBlockComponentBuilders,
      commandShortcutEvents: standardCommandShortcutEvents,
      characterShortcutEvents: standardCharacterShortcutEvents,
      editorStyle: EditorStyle.desktop(
        padding: EdgeInsets.symmetric(
          horizontal: 30.pw,
          vertical: 30.ph,
        ),
      ),
    );
  }
}
