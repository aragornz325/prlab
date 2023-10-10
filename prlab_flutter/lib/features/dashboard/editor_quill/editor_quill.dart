import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:prlab_flutter/features/dashboard/editor_quill/constructores_embebidos/imagen_embebida_web.dart';

///{@template EditorQuill}
/// Editor de texto personalizable.
///{@endtemplate}
class EditorQuill extends StatelessWidget {
  ///{@macro EditorQuill}
  const EditorQuill({
    required this.controller,
    required this.focusNode,
    this.showListNumbers = true,
    this.showListBullets = true,
    this.showListCheck = true,
    this.showCodeBlock = true,
    this.showQuote = true,
    this.showIndent = true,
    this.showLink = true,
    this.showUndo = true,
    this.showRedo = true,
    this.showDirection = true,
    this.showSearchButton = true,
    this.showSubscript = true,
    this.showSuperscript = true,
    this.showAlignmentButtons = true,
    this.showSmallButton = true,
    this.showFontFamily = false,
    this.multiRowsDisplay = true,
    this.showDividers = true,
    this.showFontSize = true,
    this.showBoldButton = true,
    this.showItalicButton = true,
    this.showUnderLineButton = true,
    this.showStrikeThrough = true,
    this.showInlineCode = true,
    this.showColorButton = true,
    this.showBackgroundColorButton = true,
    this.showClearFormat = true,
    super.key,
  });

  /// Controlador de quill.
  final QuillController controller;

  /// Un objeto que puede ser utilizado por un widget con estado
  /// para obtener el foco del teclado y manejar eventos del teclado.
  final FocusNode? focusNode;

  /// Mostrar o no un módulo para enumerar parrafos.
  final bool showListNumbers;

  /// Mostrar o no un módulo para poner bullet points.
  final bool showListBullets;

  /// Mostrar o no un módulo para poner checkboxes
  final bool showListCheck;

  /// Mostrar o no un módulo para poner una linea de código.
  final bool showCodeBlock;

  /// Mostrar o no un módulo para poner comillas
  final bool showQuote;

  /// Mostrar o no un módulo para identar.
  final bool showIndent;

  /// Mostrar o no un módulo para poner un link
  final bool showLink;

  /// Mostrar o no un módulo para deshacer el paso previo.
  final bool showUndo;

  /// Mostrar o no un módulo para rehacer el paso previo.
  final bool showRedo;

  /// Mostrar o no un módulo para cambiar la dirección del texto.
  final bool showDirection;

  /// Mostrar o no un módulo para buscar algo en el texto.
  final bool showSearchButton;

  /// Mostrar o no un módulo para subíncide.
  final bool showSubscript;

  /// Mostrar o no un módulo para superíndice.
  final bool showSuperscript;

  /// Mostrar o no botones en alineación.
  final bool showAlignmentButtons;

  /// Mostrar o no un módulo para mostrar botones pequeños.
  final bool showSmallButton;

  /// Mostrar o no un módulo para elegir una fuente.
  final bool showFontFamily;

  /// Mostrar o no un módulo para visualizar varias filas.
  final bool multiRowsDisplay;

  /// Mostrar o no un módulo para colocar divisores.
  final bool showDividers;

  /// Mostrar o no un módulo para elegir el tamaño de la fuente.
  final bool showFontSize;

  /// Mostrar o no un módulo para convertir a negrita el texto.
  final bool showBoldButton;

  /// Mostrar o no un módulo para convertir a `Italic` el texto.
  final bool showItalicButton;

  /// Mostrar o no un módulo para colocar subrayado.
  final bool showUnderLineButton;

  /// Mostrar o no un módulo para tachar por encima del texto.
  final bool showStrikeThrough;

  /// Mostrar o no un módulo para mostrar código en linea.
  final bool showInlineCode;

  /// Mostrar o no un módulo para cambiar de color el texto
  final bool showColorButton;

  /// Mostrar o no un módulo para colorear el fondo
  final bool showBackgroundColorButton;

  /// Mostrar o no un módulo para limpiar el texto.
  final bool showClearFormat;

  // Representa la imagen seleccionada por imagePicker
  // del almacenamiento de archivos local
  Future<String> _onElegirImagen(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    final copiedFile = await file.copy(
      '${appDocDir.path}/${p.basename(file.path)}',
    );

    return copiedFile.path;
  }

  /// Implementación de la imagen para editarlo.
  Future<String?> _imagenWebPickImpl(
    OnImagePickCallback onImagePickCallback,
  ) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;

    final fileName = result.files.first.name;
    final file = File(fileName);

    return onImagePickCallback(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: QuillEditor.basic(
            controller: controller,
            focusNode: focusNode,
            readOnly: false,
            embedBuilders: [
              ImagenEmbebidaWeb(),
            ],
          ),
        ),
        QuillToolbar.basic(
          controller: controller,
          showListNumbers: showListNumbers,
          showListBullets: showListBullets,
          showListCheck: showListCheck,
          showCodeBlock: showCodeBlock,
          showQuote: showQuote,
          showIndent: showIndent,
          showLink: showLink,
          showUndo: showUndo,
          showRedo: showRedo,
          showDirection: showDirection,
          showSearchButton: showSearchButton,
          showSubscript: showSubscript,
          showSuperscript: showSuperscript,
          showAlignmentButtons: showAlignmentButtons,
          showSmallButton: showSmallButton,
          showFontFamily: showFontFamily,
          showFontSize: showFontSize,
          embedButtons: FlutterQuillEmbeds.buttons(
            onImagePickCallback: _onElegirImagen,
            webImagePickImpl: _imagenWebPickImpl,
            showCameraButton: false,
            showVideoButton: false,
          ),
        ),
      ],
    );
  }
}
