import 'dart:convert';
import 'dart:math';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

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

  late Future<String> _jsonString;

  @override
  void initState() {
    final bloc = context.read<BlocEditorContenido>();

    _jsonString = Future.value(
      bloc.state.articulo?.contenido == null ||
              bloc.state.articulo?.contenido == ''
          ? jsonEncode(
              EditorState.blank().document.toJson(),
            )
          : bloc.state.articulo?.contenido ?? '',
    );

    super.initState();
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
          return FutureBuilder<String>(
            // TODO(Andreas): Una vez que este el endpoint del back,
            // consumir el json desde el estado retroalimentado por el evento.
            // stream: Stream.value(bloc.state.descripcionDeArticulo),
            future: _jsonString,
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

              editorState.transactionStream.listen((event) {
                if (event.$1 == TransactionTime.after) {
                  _jsonString = Future.value(
                    jsonEncode(editorState.document.toJson()),
                  );
                }
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
                  // TODO(anyone): Cuando el editor se maneje con
                  // streams eliminar este boton.
                  PRBoton.esOutlined(
                    onTap: () async {
                      _jsonString = Future.value(
                        jsonEncode(editorState.document.toJson()),
                      );
                      // TODO(Anyone): Fixear cuando se apreta el boton save
                      // hay error de parse.
                      context.read<BlocEditorContenido>().add(
                            BlocEditorContenidoEventoActualizarArticulo(
                              descripcionDeArticulo: jsonEncode(
                                await _jsonString,
                              ),
                            ),
                          );
                      context.read<BlocEditorContenido>().add(
                            BlocEditorContenidoEventoGuardarDatosArticulo(),
                          );
                    },
                    // TODO(Anyone): Agregar funcionalidad para mostrarle al
                    // usuario que se guardo la informacion correctamente.
                    // TODO(Andre): Agregar funcionalidad del boton.
                    // No tiene traduc porque es temporal.
                    texto: 'Save',
                    estaHabilitado: true,
                    estaCargando: state is BlocEditorContenidoEstadoCargando,
                    width: 139.pw,
                    height: max(30.ph, 30.sh),
                  ),
                ],
              );
            },
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
