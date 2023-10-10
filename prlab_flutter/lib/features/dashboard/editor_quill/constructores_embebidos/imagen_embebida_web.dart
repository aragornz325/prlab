import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:full_responsive/full_responsive.dart';

/// Contructor de imagenes dentro de el editor de texto quill.
class ImagenEmbebidaWeb extends EmbedBuilder {
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
      // TODO(anyone): Hacer soporte para imagenes locales.
      child: Image.network(imageUrl),
    );
  }
}
