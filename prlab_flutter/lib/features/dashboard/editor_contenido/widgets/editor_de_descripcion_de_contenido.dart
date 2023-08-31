import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';

class EditorDeDescripcionDeContenido extends StatefulWidget {
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

    final bloc = context.read<BlocEditorContenido>();

    return SizedBox(
      height: 352.ph,
      child: StreamBuilder<String>(
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

          bloc.add(
            BlocEditorContenidoActualizarDescripcion(snapshot.data!),
          );

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
              backgroundColor: colores.onSecondary,
              toolbarActiveColor: colores.primary,
            ),
            child: ContenedorDeDescripcionDeContenido(
              editorState: editorState,
              scrollController: scrollController,
            ),
          );
        },
      ),
    );
  }
}

class ContenedorDeDescripcionDeContenido extends StatelessWidget {
  const ContenedorDeDescripcionDeContenido({
    required this.editorState,
    required this.scrollController,
    super.key,
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
