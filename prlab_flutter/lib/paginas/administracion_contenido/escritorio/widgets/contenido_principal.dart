import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
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
    // TODO(mati): sacar por la lista del back
    var listaPrArticuls = [
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'louka',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'andre',
        status: 'Draft',
        tieneAutor: false,
      ),
    ];
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
                    // nose como funciona,pero funciona
                    // Articulo
                    ModeloLista<String>(
                      widthDeLaColumna: 300.pw,
                      lista: listaPrArticuls.map((e) => e.nombre).toList(),
                      nombreColumna: 'Article',
                      celdaEncabezadoColumna: (value) => SizedBox(
                        width: 300.pw,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.pw),
                          child: Text(
                            value,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      celda: <String>(value) {
                        return Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 30.pw),
                              width: 300.pw,
                              height: max(80.ph, 80.sh),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 300.pw,
                                    height: max(30.ph, 30.sh),
                                    child: Text(
                                      value.toString(),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: colores.tertiary,
                                        fontSize: 15.pf,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Divider(color: colores.onSecondary),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        );
                      },
                    ),

                    // TODO(anyone): cambiar por el enum del modelo
                    // Status
                    ModeloLista<String>(
                      lista: listaPrArticuls.map((e) => e.status).toList(),
                      nombreColumna: 'Status',
                      celdaEncabezadoColumna: (value) => SizedBox(
                        width: 100.pw,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      celda: <String>(value) {
                        return SizedBox(
                          width: 100.pw,
                          height: max(80.ph, 80.sh),
                          child: Column(
                            children: [
                              Container(
                                width: 100.pw,
                                height: max(30.ph, 30.sh),
                                decoration: const BoxDecoration(
                                  // TODO(mati): cambiar color al del theme
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: Center(
                                  child: Text(
                                    value.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: colores.onPrimary,
                                      fontSize: 15.pf,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: colores.onSecondary),
                            ],
                          ),
                        );
                      },
                    ),
                    // TODO (mati): preguntarle a louka como hacer para paserle un tipo DateTime

                    // Fecha
                    ModeloLista<DateTime>(
                      lista: listaPrArticuls.map((e) => e.fecha).toList(),
                      nombreColumna: 'Last Date',
                      celdaEncabezadoColumna: (value) => SizedBox(
                        width: 100.pw,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      celda: <DateTime>(DateTime value) {
                        return SizedBox(
                          width: 100.pw,
                          height: max(80.ph, 80.sh),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100.pw,
                                height: max(30.ph, 30.sh),
                                child: Center(
                                  child: Text(
                                    DateFormat.yMd().format(value),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: colores.tertiary,
                                      fontSize: 16.pf,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: colores.onSecondary),
                            ],
                          ),
                        );
                      },
                    ),

                    // Autor
                    ModeloLista<String>(
                      lista: listaPrArticuls
                          .map((e) => e.urlImageAutor.toString())
                          .toList(),
                      nombreColumna: 'Author',
                      celdaEncabezadoColumna: (value) => SizedBox(
                        width: 100.pw,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      celda: <String>(value) {
                        return SizedBox(
                          width: 100.pw,
                          height: max(80.ph, 80.sh),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100.pw,
                                height: max(30.ph, 30.sh),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 15.pf,
                                    backgroundColor: colores.onSecondary,
                                    child: CircleAvatar(
                                      radius: 15.pf,
                                      backgroundColor: colores.onSecondary,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: colores.onSecondary),
                            ],
                          ),
                        );
                      },
                    ),

                    // botones
                    ModeloLista<String>(
                      lista: listaPrArticuls.map((e) => e.status).toList(),
                      nombreColumna: '',
                      celdaEncabezadoColumna: (value) => SizedBox(
                        width: 100.pw,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: colores.primary,
                            fontSize: 16.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      celda: <String>(value) {
                        return SizedBox(
                          width: 100.pw,
                          height: max(80.ph, 80.sh),
                          child: Column(
                            children: [
                              Container(
                                height: max(30.ph, 30.sh),
                                child: Center(
                                  child: Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: colores.onPrimary,
                                      fontSize: 15.pf,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: colores.onSecondary),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
