import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/bloque_de_informacion.dart';

// TODO(Gon): Documentar
class InformacionDeLaMarca extends StatelessWidget {
// TODO(Gon): Documentar
  const InformacionDeLaMarca({
    required this.cantidadArticulos,
    required this.cantidadClippings,
    required this.cantidadMiembros,
    super.key,
  });
// TODO(Gon): Documentar
  final int cantidadArticulos;
  final int cantidadClippings;
  final int cantidadMiembros;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 485.pw,
      height: 80.ph,
      color: colores.onPrimary,
      child: Row(
        children: [
          BloqueDeInformacionDeMarca(
            cantidadArticulos: cantidadArticulos,
            icono: Icons.donut_small_outlined,
            informacion: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Articles',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.pf,
                    color: colores.secondary,
                  ),
                ),
                Text(
                  '$cantidadArticulos',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.pf,
                    color: colores.primary,
                  ),
                ),
              ],
            ),
          ),
          BloqueDeInformacionDeMarca(
            cantidadArticulos: cantidadClippings,
            tieneBordes: true,
            icono: Icons.image_outlined,
            informacion: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clippings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.pf,
                    color: colores.secondary,
                  ),
                ),
                Text(
                  '$cantidadArticulos',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.pf,
                    color: colores.primary,
                  ),
                ),
              ],
            ),
          ),
          BloqueDeInformacionDeMarca(
            cantidadArticulos: cantidadClippings,
            tieneBordes: true,
            icono: Icons.group,
            informacion: SizedBox(
              height: 30.ph,
              width: 70.pw,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 3.pw),
                itemCount: cantidadMiembros,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    widthFactor: 0.3.pw,
                    child: Container(
                      width: 33.pw,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: colores.onSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
