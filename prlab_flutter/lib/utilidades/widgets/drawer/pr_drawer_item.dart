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
    required this.icono,
    required this.tituloItem,
    this.estaSeleccionado = false,
    super.key,
  });

  final VoidCallback onTap;
  final String tituloItem;

  /// Icono izquierdo del item
  final IconData icono;

  /// Utilizable para confirmar el uso del indicador izquierdo
  final bool estaSeleccionado;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Padding(
      padding: EdgeInsets.only(top: 20.ph),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 210.pw,
          height: 40.ph,
          decoration: BoxDecoration(
            color: estaSeleccionado
                ? colores.primaryOpacidadDiez
                : colores.surfaceTint,
          ),
          child: Row(
            children: [
              if (estaSeleccionado) const DrawerIndicadorItemSeleccionado(),
              Padding(
                padding: EdgeInsets.only(left: estaSeleccionado ? 0.pw : 30.pw),
                child: Icon(
                  icono,
                  color: colores.primary,
                ),
              ),
              SizedBox(width: 5.pw),
              Text(
                tituloItem,
                style: TextStyle(color: colores.primary, fontSize: 16.pf),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
