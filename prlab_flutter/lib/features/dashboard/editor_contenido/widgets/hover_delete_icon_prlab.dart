import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/efecto_blur_prlab.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template HoverDeleteIconPRLab}}
/// Componente que tras pasar el mouse por encima aparece un icono con un fondo
/// difuminado para poder borrar
/// el item seleccionado [HoverDeleteIconPRLab].
/// {@endtemplate}
class HoverDeleteIconPRLab extends StatefulWidget {
  /// {@macro HoverDeleteIconPRLab}
  const HoverDeleteIconPRLab({
    required this.onTapEliminar,
    super.key,
    this.onTapSeleccionar,
    this.condicionVisibility = true,
    this.itemEstaSeleccionado = true,
    this.contenido,
  });

  /// Elimina el componente sobre el que esta el usuario.
  final void Function()? onTapEliminar;

  /// Selecciona el componente sobre el que esta el usuario y ejecuta la
  /// función.
  final void Function()? onTapSeleccionar;

  /// Es la condición para mostrar el widget hover con el icono. En caso de ser
  /// true lo va a mostrar.
  final bool condicionVisibility;

  /// Indica si el item, el widget esta seleccionado para poder cambiar el color
  /// del hover u alguna otra característica.
  final bool itemEstaSeleccionado;

  /// Widget que es el cuerpo, el contenido donde va a aparecer el hover icon.
  final Widget? contenido;

  @override
  State<HoverDeleteIconPRLab> createState() => _HoverDeleteIconPRLabState();
}

class _HoverDeleteIconPRLabState extends State<HoverDeleteIconPRLab> {
  /// Indica si la pagina tiene el mouse del usuario encima o no, para agregar
  /// el tacho de basura permitiéndole poder borrarla.
  bool _mouseEncima = false;

  /// Indica si el componente tiene el mouse del
  /// usuario encima o no, para agregar
  /// el tacho de basura permitiéndole poder borrarlo.
  void _cursorEncima(
    bool isHovered,
  ) {
    setState(() {
      _mouseEncima = isHovered;
    });
  }

// TODO(SAM): En algun momento hacer factory de componente hover.
// TODO(SAM): Pasar colores para evitar la variable final bool
// itemEstaSeleccionado;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return MouseRegion(
      onEnter: (event) => _cursorEncima(true),
      onExit: (event) => _cursorEncima(false),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20.ph,
              left: 10.pw,
              right: 10.pw,
            ),
            child: InkWell(
              onTap: widget.onTapSeleccionar,
              child: Container(
                width: 132.pw,
                height: 55.ph,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sw),
                  border: widget.itemEstaSeleccionado
                      ? Border.all(
                          color: colores.primary,
                        )
                      : null,
                  color: widget.itemEstaSeleccionado
                      ? colores.primaryOpacidadVeinte
                      : colores.background,
                ),
                child: widget.contenido,
              ),
            ),
          ),
          Positioned(
            top: 30.ph,
            right: 11.pw,
            child: Visibility(
              visible: _mouseEncima && widget.condicionVisibility,
              child: SizedBox(
                width: 32.pw,
                height: max(38.ph, 38.sh),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: widget.onTapEliminar,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.sw),
                    child: CustomPaint(
                      painter: EfectoBlurPRLab(
                        color: widget.itemEstaSeleccionado
                            ? colores.primaryOpacidadVeinte
                            : colores.background,
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
