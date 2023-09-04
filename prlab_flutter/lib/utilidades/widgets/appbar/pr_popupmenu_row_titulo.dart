import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template PRPopUpMenuRowTitulo}
/// Row que va a alojar el título y la flecha utilizados
/// para cada item de PRAppBar
/// {@endtemplate}
class PRPopUpMenuRowTitulo extends StatelessWidget {
  /// {@macro PRPopUpMenuRowTitulo}
  const PRPopUpMenuRowTitulo({
    required this.tituloMenu,
    required this.estaExpandido,
    super.key,
  });

  /// Título que va a tomar el item
  final String tituloMenu;

  /// Definira la orientacion del icono
  final bool estaExpandido;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Container(
      decoration: BoxDecoration(color: colores.surfaceTint),
      height: 30.ph,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.pw),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tituloMenu,
              style: TextStyle(
                color: colores.tertiary,
                fontSize: 16.pf,
              ),
            ),
            SizedBox(width: 5.pw),
            Icon(
              // TODO(Manu): definir si es necesario o como hacerlo
              estaExpandido
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_rounded,
              color: colores.tertiary,
              size: 24.pf,
            ),
          ],
        ),
      ),
    );
  }
}
