import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:full_responsive/full_responsive.dart';

import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/efecto_blur_prlab.dart';

/// {@template HoverDeleteIconConImagen}
/// Componente que tras pasar el mouse por encima aparece un icono con un fondo
/// difuminado para poder borrar
/// la imagen seleccionada [HoverDeleteIconConImagen].
/// {@endtemplate}
class HoverDeleteIconConImagen extends StatefulWidget {
  /// {@macro HoverDeleteIconConImagen}
  const HoverDeleteIconConImagen({
    required this.onTap,
    super.key,
    this.condicionVisibility = true,
    this.imagenCelular,
    this.imagenWeb, // TODO(SAM): Extraer luego widget de imagenes.
  });
  // TODO(Anyone): Documentar
  final bool condicionVisibility;
  final void Function()? onTap;
  final File? imagenCelular;
  final Uint8List? imagenWeb;
  @override
  State<HoverDeleteIconConImagen> createState() =>
      _HoverDeleteIconConImagenState();
}

class _HoverDeleteIconConImagenState extends State<HoverDeleteIconConImagen> {
  bool _mouseEncima = false;
  bool? _esLogoPrincipal;

  /// Indica si el logo primario o segundario tiene el mouse del
  /// usuario encima o no, para agregar
  /// el tacho de basura permitiendole poder borrarla.
  void _cursorEncima(
    bool isHovered,
    bool? logoPrimario,
  ) {
    setState(() {
      _mouseEncima = isHovered;
      _esLogoPrincipal = logoPrimario;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final imagenElegidaWeb = widget.imagenWeb ?? Uint8List(0);
    final imagenElegidaCelular = widget.imagenCelular ?? File('a');

    return MouseRegion(
      onEnter: (event) => _cursorEncima(true, true),
      onExit: (event) => _cursorEncima(false, true),
      child: Stack(
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    size: 24.pw,
                  ),
                  SizedBox(
                    width: 64.pw,
                    height: 64.ph,
                    child: kIsWeb
                        ? Image.memory(
                            imagenElegidaWeb,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            imagenElegidaCelular,
                            fit: BoxFit.fill,
                          ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 13.ph,
            right: 0.pw,
            child: Visibility(
              visible: _mouseEncima &&
                  widget.condicionVisibility &&
                  _esLogoPrincipal!,
              child: SizedBox(
                width: 32.pw,
                height: max(38.ph, 38.sh),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: widget.onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.sw),
                    child: CustomPaint(
                      painter: EfectoBlurPRLab(
                        color: colores.background,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        size: 21.pw,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
