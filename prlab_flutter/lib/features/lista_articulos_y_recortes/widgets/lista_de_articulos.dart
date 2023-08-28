// ignore_for_file: inference_failure_on_instance_creation

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/lista_articulos_y_recortes/popup/popup.dart';
import 'package:prlab_flutter/features/lista_articulos_y_recortes/widgets/pr_articulo.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/widgets/widgets.dart';

/// {@template ListaDeArticulos}
/// Muestra la lista de los artículos con sus atributos.nombre,estado,ultima
/// fecha actualizada y dos opciones de compartir y de opciones.
/// {@endtemplate}
class ListaDeArticulos extends StatelessWidget {
  /// {@macro ListaDeArticulos}
  const ListaDeArticulos({
    required this.articulos,
    super.key,
  });

  // separar ese componente su propio bloc y envuelve el componente
  // hacer el init que filtre por un enum de filtros
  // TODO(anyone): pasarle la lista de el modelo del Articulo esto es de ejemplo
  /// Lista de los artículos para mostrar sus propiedades
  final List<PRArticulo> articulos;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Grilla(
      listaColumnas: [
        // Articulo
        Columna(
          widthDeLaColumna: 400.pw,
          lista: articulos.map((e) => e.nombre).toList(),
          nombreColumna: l10n.commonArticles,
          celdaEncabezadoColumna: (value) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: max(10.ph, 10.sh),
            ),
            child: SizedBox(
              width: 400.pw,
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
          ),
          celda: (value) {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30.pw),
                  width: 400.pw,
                  height: max(80.ph, 80.sh),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400.pw,
                        height: max(50.ph, 50.sh),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            value,
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
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.status).toList(),
          nombreColumna: l10n.pageContentAdministrationBarInformationStatus,
          celdaEncabezadoColumna: (value) => SizedBox(
            width: 150.pw,
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
          celda: (value) {
            return SizedBox(
              width: 150.pw,
              height: max(80.ph, 80.sh),
              child: Column(
                children: [
                  SizedBox(
                    height: max(50.ph, 50.sh),
                    child: Center(
                      child: Container(
                        width: 100.pw,
                        height: max(35.ph, 35.sh),
                        decoration: BoxDecoration(
                          color: colores.secondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            value,
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
                    ),
                  ),
                  Divider(color: colores.onSecondary),
                ],
              ),
            );
          },
        ),

        // Fecha
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.fecha).toList(),
          nombreColumna: l10n.pageContentAdministrationBarInformationLastUpdate,
          celdaEncabezadoColumna: (value) => SizedBox(
            width: 150.pw,
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
          celda: (value) {
            return SizedBox(
              width: 150.pw,
              height: max(80.ph, 80.sh),
              child: Column(
                children: [
                  SizedBox(
                    width: 150.pw,
                    height: max(50.ph, 50.sh),
                    child: Center(
                      child: Text(
                        DateFormat('d MMM y').format(value),
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
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.urlImageAutor.toString()).toList(),
          nombreColumna: l10n.pageContentAdministrationBarInformationAuthor,
          celdaEncabezadoColumna: (value) => SizedBox(
            width: 150.pw,
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
          celda: (value) {
            return SizedBox(
              width: 150.pw,
              height: max(80.ph, 80.sh),
              child: Column(
                children: [
                  SizedBox(
                    width: 150.pw,
                    height: max(50.ph, 50.sh),
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
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.status).toList(),
          nombreColumna: '',
          celdaEncabezadoColumna: (value) => SizedBox(
            width: 150.pw,
            child: Text(
              value,
              style: TextStyle(
                color: colores.primary,
                fontSize: 16.pf,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          celda: (value) {
            return Container(
              padding: EdgeInsets.only(right: 30.pw),
              width: 150.pw,
              height: max(80.ph, 80.sh),
              child: Column(
                children: [
                  SizedBox(
                    width: 150.pw,
                    height: max(50.ph, 50.sh),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // TODO(anyone): agregarle funcionalidad
                          },
                          icon: Icon(
                            Icons.share_outlined,
                            size: 18.pf,
                            color: colores.primary,
                          ),
                        ),
                        const PopUpMenuOpcionesArticulo(),
                        SizedBox(width: 10.pw),
                      ],
                    ),
                  ),
                  Divider(color: colores.onSecondary),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
