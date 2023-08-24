import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

import '../../../../widgets/widgets.dart';

// TODO(mati): hacer documentacion
class ContenidoPrincipal extends StatelessWidget {
  // TODO(mati): hacer documentacion
  const ContenidoPrincipal({
    required this.descripcionArticulo,
    this.nombreArticulo,
    super.key,
  });
  final String? nombreArticulo;
  final String descripcionArticulo;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 1000.pw,
      color: colores.background,
      child: Column(
        children: [
          TituloBotonCrearArticulo(nombreArticulo: nombreArticulo),
          DescripcionArticulo(descripcionArticulo: descripcionArticulo),
          SizedBox(height: max(20.ph, 20.sh)),
          Container(
            height: max(530.ph, 530.sh),
            width: 1000.pw,
            color: colores.onPrimary,
            child: Column(
              children: [
                const BotonesArticulosYRecorte(),
                Divider(color: colores.onSecondary),
                const TextFieldBusquedaFiltrado(),
                Divider(color: colores.onSecondary),
                // const ListaArticulos(tieneAutor: true),
                Grilla(
                  listaModelos: [
                    ModeloLista(
                      lista: [
                        PRArticulo(
                            ultimaFecha: DateTime.now(),
                            nombre: '',
                            status: '',
                            tieneAutor: false),
                      ],
                      celda: (_) {
                        return null;
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
