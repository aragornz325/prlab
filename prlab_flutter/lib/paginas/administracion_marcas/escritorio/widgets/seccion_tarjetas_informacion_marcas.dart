import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/informacion_de_la_marca.dart';

// TODO(Gon): Documentar
class SeccionTarjetasDeInformacionDeMarcas extends StatelessWidget {
// TODO(Gon): Documentar
  const SeccionTarjetasDeInformacionDeMarcas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.ph,
      width: 1040.pw,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const InformacionDeLaMarca(
            cantidadArticulos: 3,
            cantidadClippings: 3,
            cantidadMiembros: 4,
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 35.ph),
        itemCount: 2,
      ),
    );
  }
}
