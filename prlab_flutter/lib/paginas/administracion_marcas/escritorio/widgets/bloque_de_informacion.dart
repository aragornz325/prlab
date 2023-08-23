import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

// TODO(Gon): Documentar
class BloqueDeInformacionDeMarca extends StatelessWidget {
// TODO(Gon): Documentar
  const BloqueDeInformacionDeMarca({
    required this.cantidadArticulos,
    required this.icono,
    required this.informacion,
    this.tieneBordes = false,
    super.key,
  });

// TODO(Gon): Documentar
  final int cantidadArticulos;
  final bool tieneBordes;
  final IconData icono;
  final Widget informacion;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      decoration: tieneBordes
          ? BoxDecoration(
              border: Border(
                left: BorderSide(width: 1.pw, color: colores.secondary),
                right: BorderSide(width: 1.pw, color: colores.secondary),
              ),
            )
          : null,
      width: 160.pw,
      height: 80.ph,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              size: 40.pf,
              color: colores.secondary,
            ),
            SizedBox(width: 5.pw),
            informacion,
          ],
        ),
      ),
    );
  }
}
