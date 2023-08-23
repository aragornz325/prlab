import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/header_de_seccion.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/seccion_tarjetas_informacion_marcas.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/seccion_tarjetas_marca.dart';

// TODO(Gon): Documentar
class VistaEscritorioAdministracionMarcas extends StatelessWidget {
// TODO(Gon): Documentar
  const VistaEscritorioAdministracionMarcas({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: Row(
        children: [
          Container(
            width: 210.pw,
            height: 100.hp,
            color: colores.primary.withOpacity(.5),
          ),
          SizedBox(width: 30.pw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1040.pw,
                height: 100.ph,
                color: colores.primary.withOpacity(.5),
              ),
              SizedBox(height: 40.pw),
              const HeaderDeSeccion(),
              SizedBox(height: 20.pw),
              const SeccionTarjetasDeMarca(),
              SizedBox(height: 30.pw),
              const SeccionTarjetasDeInformacionDeMarcas(),
              SizedBox(
                width: 1040.pw,
                height: 85.ph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
