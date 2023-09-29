import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
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
  /// Controllador para el manejo de contenido de un
  /// `EntregableArticulo`.
  late QuillController _controller;

  /// Genera una espera antes de guardar la nueva data del contenido
  /// en la db para mejorar la performance.
  Timer? _debounce;

  /// Contiene el contenido del articulo en formato `delta`, esto
  /// permite hacer ciertas validaciónes y manejar la información
  /// del mismo.
  String? _jsonDelContenido;

  /// Foco para el contenido del `EntregableArticulo`.
  final _focusNode = FocusNode();

  @override
  void initState() {
    final articulo = context.read<BlocEditorContenido>().state.articulo;

    _controller = QuillController(
      document: Document.fromJson(
        jsonDecode(articulo?.contenido ?? '') as List,
      ),
      selection: const TextSelection.collapsed(offset: 0),
    );

    _jsonDelContenido = jsonEncode(
      _controller.document.toDelta().toJson(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

// Representa la imagen seleccionada por imagePicker
// del almacenamiento de archivos local
  Future<String> _onElegirImagen(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    final copiedFile = await file.copy(
      '${appDocDir.path}/${p.basename(file.path)}',
    );

    return copiedFile.path;
  }

  Future<String?> _imagenWebPickImpl(
    OnImagePickCallback onImagePickCallback,
  ) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }

    final fileName = result.files.first.name;
    final file = File(fileName);

    return onImagePickCallback(file);
  }

  void _blocListener(
    BuildContext context,
    BlocEditorContenidoEstado state,
  ) {
    if (state is BlocEditorContenidoEstadoActualizandoDesdeStream) {
      _jsonDelContenido = state.articulo?.contenido ?? _jsonDelContenido;

      _controller.document = Document.fromJson(
        jsonDecode(_jsonDelContenido ?? '') as List,
      );
    }
  }

  /// Actualiza luego
  void _onControllerListener(BlocEditorContenidoEstado state) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _jsonDelContenido = jsonEncode(
        _controller.document.toDelta().toJson(),
      );

      // Evita actualizar el articulo innecesariamente.
      if (_jsonDelContenido == state.articulo?.contenido) {
        return;
      }

      widget.onChanged.call(_jsonDelContenido ?? '');

      context.read<BlocEditorContenido>().add(
            BlocEditorContenidoEventoActualizarArticulo(
              descripcionDeArticulo: _jsonDelContenido,
            ),
          );

      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(352.ph, 352.sh),
      child: BlocConsumer<BlocEditorContenido, BlocEditorContenidoEstado>(
        listener: _blocListener,
        builder: (context, state) {
          if (state is BlocEditorContenidoEstadoCargando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.pw,
              vertical: 20.sh,
            ),
            child: Column(
              children: [
                Expanded(
                  child: QuillEditor.basic(
                    controller: _controller,
                    focusNode: _focusNode,
                    readOnly: false,
                    embedBuilders: [
                      _ImageEmbedBuilderWeb(),
                    ],
                  ),
                ),
                QuillToolbar.basic(
                  controller: _controller
                    ..addListener(() => _onControllerListener(state)),
                  showDirection: true,
                  showAlignmentButtons: true,
                  showSmallButton: true,
                  showFontFamily: false,
                  embedButtons: FlutterQuillEmbeds.buttons(
                    onImagePickCallback: _onElegirImagen,
                    webImagePickImpl: _imagenWebPickImpl,
                    showCameraButton: false,
                    showVideoButton: false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ImageEmbedBuilderWeb extends EmbedBuilder {
  @override
  String get key => BlockEmbed.imageType;

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed node,
    bool readOnly,
    bool inline,
    TextStyle textStyle,
  ) {
    final imageUrl = node.value.data as String;

    return SizedBox(
      height: max(200.ph, 200.sh),
      child: Image.network(imageUrl),
    );
  }
}
