import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';

/// {@template  EditorDeDescripcionDeContenido}
/// Contiene los elementos para la edición
/// de la descripción de un 'PRArticulo', esta seteado con
/// el package de appflowy_editor y customizado para que se
/// asemeje a el tema de la aplicación.
/// {@endtemplate}
class EditorDeDescripcionDeContenido extends StatefulWidget {
  /// {@macro EditorDeDescripcionDeContenido}
  const EditorDeDescripcionDeContenido({
    required this.onChanged,
    super.key,
  });

  /// Se ejecuta cuando se genera un cambio en el contenido del
  /// articulo y devuelve el nuevo valor del mismo.
  final void Function(String value) onChanged;

  @override
  State<EditorDeDescripcionDeContenido> createState() =>
      _EditorDeDescripcionDeContenidoState();
}

class _EditorDeDescripcionDeContenidoState
    extends State<EditorDeDescripcionDeContenido> {
  final scrollController = ScrollController();

  late String _jsonDelContenido;

  /// Genera una espera antes de guardar la nueva data del contenido
  /// en la db para mejorar la performance.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    final articulo = context.read<BlocEditorContenido>().state.articulo;

    _jsonDelContenido = articulo?.contenido ??
        jsonEncode(EditorState.blank().document.toJson());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editorState = EditorState(
      document: Document.fromJson(
        Map<String, Object>.from(
          json.decode(_jsonDelContenido) as Map,
        ),
      ),
    );

    editorState.transactionStream.listen((event) {
      if (event.$1 == TransactionTime.after) {
        widget.onChanged.call(_jsonDelContenido);

        if (_debounce?.isActive ?? false) _debounce?.cancel();

        _debounce = Timer(const Duration(milliseconds: 500), () {
          _jsonDelContenido = jsonEncode(editorState.document.toJson());

          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoActualizarArticulo(
                  descripcionDeArticulo: _jsonDelContenido,
                ),
              );
        });
      }
    });

    return SizedBox(
      height: max(352.ph, 352.sh),
      child: BlocConsumer<BlocEditorContenido, BlocEditorContenidoEstado>(
        listener: (context, state) {
          if (state.articulo?.contenido != _jsonDelContenido) {
            setState(() {
              _jsonDelContenido =
                  state.articulo?.contenido ?? _jsonDelContenido;
            });
          }
        },
        builder: (context, state) {
          if (state is BlocEditorContenidoEstadoCargando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              FloatingToolbar(
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

    return SizedBox(
      height: max(310.ph, 310.sh),
      child: AppFlowyEditor(
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
      ),
    );
  }
}
