import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

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

  late String _jsonDelContenido;

  /// A medida que el usuario va escribiendo el contenido del [Articulo]
  /// se va guardando en la lista las versiones anteriores del mismo.
  ///
  /// Esto permite condicionar si la información que llega del stream fue
  /// o no escrita por el usuario actual, para no pisar los datos del estado.
  ///
  /// Ej:
  /// Se escribe `hola`
  /// Lista : [`h`, `ho`, `hol`, `hola`].
  final List<String> versionesDelContenido = [];

  /// Genera una espera antes guardar la nueva data del contenido
  /// en la db para mejorar la performance.
  Timer? _debounce;

  // Nos ayuda a mantener una conexión persistente y
  // se reconecta automáticamente si perdemos la conexión con el servidor.
  late final StreamingConnectionHandler connectionHandler;

  @override
  void initState() {
    super.initState();
    _actualizarContenido();

    // Configura nuestro controlador de conexión y abre una conexión
    // de streaming al servidor. El [StreamingConnectionHandler] intentará
    // volver a conectarse hasta que se llama al método `close`.
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (_) {},
    );

    connectionHandler.connect();
  }

  /// Maneja cada actualización del servidor a medida que llega.
  ///
  /// Si un [Articulo] fue actualizado por otro cliente, se actualiza
  /// dentro del [Bloc].
  Future<void> _actualizarContenido() async {
    await for (final actualizado in client.articulo.stream) {
      if (actualizado is Articulo) {
        if (!versionesDelContenido.contains(actualizado.contenido)) {
          versionesDelContenido.clear();

          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoActualizarArticulo(
                  descripcionDeArticulo: actualizado.contenido,
                  seActualizaDesdeStream: true,
                ),
              );
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(352.ph, 352.sh),
      child: BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
        builder: (context, state) {
          if (state is BlocEditorContenidoEstadoCargando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // TODO(Andre):
          // Esta llegando la data nueva del stream pero no se esta actualizando
          // dentro de la UI el nuevo texto del contenido, resolver antes de
          // hacer el commit.
          _jsonDelContenido = state.articulo?.contenido ??
              jsonEncode(EditorState.blank().document.toJson());

          final editorState = EditorState(
            document: Document.fromJson(
              Map<String, Object>.from(
                json.decode(_jsonDelContenido) as Map,
              ),
            ),
          );

          editorState.transactionStream.listen((event) {
            versionesDelContenido.add(_jsonDelContenido);

            if (_debounce?.isActive ?? false) _debounce?.cancel();

            _debounce = Timer(const Duration(milliseconds: 500), () {
              _jsonDelContenido = jsonEncode(editorState.document.toJson());

              context.read<BlocEditorContenido>().add(
                    BlocEditorContenidoEventoActualizarArticulo(
                      descripcionDeArticulo: _jsonDelContenido,
                    ),
                  );
            });
          });

          return Column(
            children: [
              SizedBox(
                height: max(310.ph, 310.sh),
                child: FloatingToolbar(
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
                  child: _ContenedorDeDescripcionDeContenido(
                    editorState: editorState,
                    scrollController: scrollController,
                  ),
                ),
              ),
            ],
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
