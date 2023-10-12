import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

///{@template PrevisualizacionContenidoDeCorreo}
/// Muestra el [htmlData] que se le pasa como parametro
/// renderizado en un popup en el medio de la pantalla.
///{@endtemplate}
class PrevisualizacionContenidoDeCorreo extends StatelessWidget {
  ///{@macro PrevisualizacionContenidoDeCorreo}
  const PrevisualizacionContenidoDeCorreo({
    required this.htmlData,
    super.key,
    this.width = 1000,
  });

  /// Ancho del popup.
  final double width;

  /// codigo HTML a renderizarse.
  final String htmlData;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return AlertDialog(
      shape: const RoundedRectangleBorder(),
      contentPadding: EdgeInsets.zero,
      backgroundColor: colores.surfaceTint,
      content: SizedBox(
        width: width,
        child: SingleChildScrollView(child: Html(data: htmlData)),
      ),
    );
  }
}
