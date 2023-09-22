import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';

/// {@template PRDrawerItem}
/// Item disponible a utilizar en PRDrawer
/// {@endtemplate}
class PRDrawerItem extends StatelessWidget {
  /// {@macro PRDrawerItem}
  const PRDrawerItem({
    required this.onTap,
    required this.tituloItem,
    this.icono,
    this.iconImage,
    this.estaSeleccionado = false,
    super.key,
  });

  /// Se utiliza para definir la acción que se debe realizar cuando el usuario
  /// hace clic o toca el elemento.
  final VoidCallback onTap;

  /// Titulo del item para los items del drawers
  final String tituloItem;

  /// Icono izquierdo del item
  final IconData? icono;

  /// Path de la imagen a usar como icono
  final String? iconImage;

  /// Utilizable para confirmar el uso del indicador izquierdo
  final bool estaSeleccionado;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 210.pw,
        height: max(40.ph, 40.sh),
        decoration: BoxDecoration(
          color: estaSeleccionado
              ? colores.primaryOpacidadDiez
              : colores.surfaceTint,
        ),
        child: Row(
          children: [
            if (estaSeleccionado) const DrawerIndicadorItemSeleccionado(),
            Padding(
              padding: EdgeInsets.only(
                left: estaSeleccionado ? 22.pw : 30.pw,
              ),
              child: icono != null
                  ? Icon(
                      icono,
                      color: colores.primary,
                      size: 24.pw,
                    )
                  : iconImage != null
                      ? Image.asset(
                          iconImage!,
                          fit: BoxFit.cover,
                          height: max(30.ph, 30.sh),
                        )
                      : Container(),
            ),
            SizedBox(width: 5.pw),
            Text(
              tituloItem,
              style: TextStyle(
                color: colores.primary,
                fontSize: 16.pf,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
