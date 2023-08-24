import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class VistaEscritorioAdministracionContenido extends StatelessWidget {
// TODO(mati): hacer documentacion
  const VistaEscritorioAdministracionContenido({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO(anyone): cambiar por el drawer
            SizedBox(width: 210.pw, height: 100.hp),
            SizedBox(width: 30.pw, height: 100.hp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO(anyone): cambiar por el appbar
                SizedBox(height: max(100.ph, 100.sh), width: 1000.pw),
                const ContenidoPrincipal(
                  descripcionArticulo:
                      'Lorem ipsum dolor sit amet consectetur. Mattis'
                      ' dolor sapien pulvinar sed.',
                ),
                // TODO(anyone): cambiar por el banner de abajo
                SizedBox(height: max(90.ph, 90.sh), width: 1000.pw),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO(anyone): hablar con louka/andre si se va a utilizar este codigo
/*
class Lista<T> extends StatelessWidget {
  const Lista({
    required this.listita,
    super.key,
  });

  final List<ModeloDeLaLista<T>> listita;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ...listita.map(
              (e) => Column(
                children: [
                  if (e.celdaDeColumna != null)
                    e.celdaDeColumna!(e.nombreDeColumna ?? '')
                  else
                    Text(e.nombreDeColumna ?? ''),
                  SizedBox(
                    width: 100.pw,
                    height: 100.pw,
                    child: ListView.builder(
                      itemCount: e.lista.length,
                      itemBuilder: (BuildContext context, int index) =>
                          e.celda(e.lista[index]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ModeloDeLaLista<T> {
  ModeloDeLaLista({
    required this.lista,
    required this.celda,
    this.nombreDeColumna,
    this.celdaDeColumna,
  });

  final String? nombreDeColumna;
  final List<T> lista;
  final Widget Function(T value) celda;
  final Widget Function(String value)? celdaDeColumna;
}

class CualquierPagina extends StatelessWidget {
  const CualquierPagina({required this.arts, super.key});

  final List<PRArticulo> arts;

  @override
  Widget build(BuildContext context) {
    return Lista(
      listita: [
        ModeloDeLaLista(
          lista: arts.map((e) => e.nombre).toList(),
          nombreDeColumna: 'Nombre de usuario',
          celda: (value) => SizedBox(
            height: 20,
            width: 100,
            child: Text(value),
          ),
        ),
        ModeloDeLaLista(
          lista: arts.map((e) => e.ultimaFecha).toList(),
          nombreDeColumna: 'Cuanto se regustro el usuario',
          celda: (value) => SizedBox(
            height: 20,
            width: 100,
            child: Text(value.toIso8601String()),
          ),
        ),
      ],
    );
  }
}
*/
