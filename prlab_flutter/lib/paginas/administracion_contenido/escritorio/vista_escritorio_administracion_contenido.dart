import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

// TODO(mati): hacer documentacion
class VistaEscritorioAdministracionContenido extends StatelessWidget {
// TODO(mati): hacer documentacion
  const VistaEscritorioAdministracionContenido({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: max(560.ph, 560.sh),
              width: 1000.pw,
              // TODO(mati): cambiar el color
              color: colores.onPrimary,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 40.pf,
                          color: colores.primary,
                        ),
                        Text(
                          // TODO(mati): hacer que reciba el nombre del articulo a modificar
                          'Your articles',
                          style: TextStyle(
                            fontSize: 30.pf,
                            fontWeight: FontWeight.w600,
                            color: colores.tertiary,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              width: max(140.pw, 140.sw),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: max(30.ph, 30.sh),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(100),
                                    ),
                                    color: colores.primary,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Create an article',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.pf,
                                        color: colores.onPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 1.pw,
                              height: max(30.ph, 30.sh),
                              color: colores.primaryBajaOpacidad,
                            ),
                            SizedBox(
                              height: max(30.ph, 30.sh),
                              width: max(40.pw, 40.sw),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: max(30.ph, 30.sh),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(100),
                                    ),
                                    color: colores.primary,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: colores.onPrimary,
                                      size: 24.pf,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 1000.pw,
                      child: Text(
                        // TODO(mati): hacer que reciba una descripcion del articulo
                        'Lorem ipsum dolor sit amet consectetur. Mattis dolor sapien pulvinar sed.',
                        maxLines: 1,
                        textAlign: TextAlign.start,

                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colores.secondary,
                          fontSize: 15.pf,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.pw,
                        vertical: max(20.ph, 20.sh),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  size: 18.pf,
                                  color: colores.primary,
                                ),
                                SizedBox(width: 5.pw),
                                Text(
                                  // TODO(mati) hacer l10n
                                  'Articles',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.pf,
                                    color: colores.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 40.pw),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 18.pf,
                                  color: colores.secondary,
                                ),
                                SizedBox(width: 5.pw),
                                Text(
                                  // TODO(mati) hacer l10n
                                  'Clippings',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.pf,
                                    color: colores.secondary,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(color: colores.onSecondary),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: max(20.ph, 20.sh)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 410.pw,
                            height: max(50.ph, 50.sh),
                            padding: EdgeInsets.symmetric(horizontal: 5.pw),
                            decoration: BoxDecoration(
                              color: colores.onPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: colores.secondary),
                            ),
                            child: Center(
                              child: TextFormField(
                                style: TextStyle(
                                  color: colores.primary,
                                  fontSize: 15.pf,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  // TODO(mati): hacer l10n
                                  hintText: 'Search',
                                  border: InputBorder.none,

                                  prefixIcon: Icon(
                                    Icons.manage_search,
                                    color: colores.secondary,
                                    size: 20.pf,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // TODO(mati): hacer los dropdown
                          Container(
                            width: 410.pw,
                            height: max(50.ph, 50.sh),
                            padding: EdgeInsets.symmetric(horizontal: 5.pw),
                            decoration: BoxDecoration(
                              color: colores.onPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: colores.secondary),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: colores.secondary,
                                  size: 20.pf,
                                ),
                                SizedBox(width: 10.pw),
                                Text(
                                  // TODO(mati): hacer l10n
                                  'All',
                                  style: TextStyle(
                                    color: colores.secondary,
                                    fontSize: 15.pf,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: colores.secondary,
                                  size: 20.pf,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: colores.onSecondary),
                    const ListaDeArticulos(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaDeArticulos extends StatelessWidget {
  const ListaDeArticulos({super.key});
  final bool tieneAutor = true;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.pw,
        vertical: max(30.ph, 30.sh),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 500.pw,
                child: Text(
                  // TODO(mati): hacer l10n
                  'Articles',
                  style: TextStyle(
                    color: colores.primary,
                    fontSize: 16.pf,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: tieneAutor ? 350.pw : 400.pw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100.pw,
                      height: max(30.ph, 30.sh),
                      decoration: BoxDecoration(
                        color: colores.onPrimary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child: Text(
                          // TODO(mati): hacer l10n
                          'Status',
                          style: TextStyle(
                            color: colores.primary,
                            fontSize: 16.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // TODO(mati): hacer l10n
                      'Last update',
                      style: TextStyle(
                        color: colores.primary,
                        fontSize: 16.pf,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // TODO(mati): sacar si no es mi articulo
                    ...[
                      if (tieneAutor)
                        Text(
                          // TODO(mati): hacer l10n
                          'Author',
                          style: TextStyle(
                            color: colores.primary,
                            fontSize: 16.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ]
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          Container(
            width: 1000.pw,
            height: max(200.ph, 200.sh),
            padding: EdgeInsets.symmetric(vertical: max(10.ph, 10.sh)),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => PRArticulo(
                nombre: 'Flutter article',
                status: 'Feedback',
                ultimaFecha: DateTime.now(),
                tieneAutor: tieneAutor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PRArticulo extends StatelessWidget {
  const PRArticulo({
    required this.ultimaFecha,
    required this.nombre,
    required this.status,
    required this.tieneAutor,
    this.urlImage,
    this.autor,
    super.key,
  });
  final String nombre;
  final String status;
  final DateTime ultimaFecha;
  final bool tieneAutor;
  final String? autor;
  final String? urlImage;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 500.pw,
              child: Text(
                nombre,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 16.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: tieneAutor ? 335.pw : 400.pw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.pw,
                    height: max(30.ph, 30.sh),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Text(
                        status,
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
                  Text(
                    '${DateFormat.M().format(ultimaFecha)}'
                    ' ${DateFormat.MMM().format(ultimaFecha)}'
                    ' ${DateFormat.y().format(ultimaFecha)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: colores.tertiary,
                      fontSize: 16.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ), // TODO(mati): sacar si no es mi articulo
                  ...[
                    if (tieneAutor)
                      CircleAvatar(
                        radius: 15.pf,
                        backgroundColor: colores.onSecondary,
                        child: CircleAvatar(
                          radius: 15.pf,
                          backgroundColor: colores.onSecondary,
                          backgroundImage:
                              urlImage != null ? NetworkImage(urlImage!) : null,
                        ),
                      ),
                  ]
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                size: 18.pf,
                color: colores.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                size: 18.pf,
                color: colores.primary,
              ),
            ),
          ],
        ),
        Divider(color: colores.onSecondary),
      ],
    );
  }
}

class Lista<T> extends StatelessWidget {
  const Lista({required this.listita, super.key});

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
                  ListView.builder(
                    itemCount: e.lista.length,
                    itemBuilder: (BuildContext context, int index) =>
                        e.celda(e.lista[index]),
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
