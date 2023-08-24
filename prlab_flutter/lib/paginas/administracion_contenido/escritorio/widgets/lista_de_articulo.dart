import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/pr_articulo.dart';

import 'package:prlab_flutter/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class ListaArticulos extends StatelessWidget {
// TODO(mati): hacer documentacion
  const ListaArticulos({
    super.key,
    required this.articulos,
  });

  // TODO(anyone): pasarle la lista de el modelo del Articulo
  final List<PRArticulo> articulos;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Grilla(
      listaModelos: [
        // nose como funciona,pero funciona
        // Articulo
        ModeloLista<String>(
          widthDeLaColumna: 400.pw,
          lista: articulos.map((e) => e.nombre).toList(),
          nombreColumna: l10n.commonArticle,
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
          celda: <String>(value) {
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
          celda: <String>(value) {
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
                        decoration: const BoxDecoration(
                          // TODO(mati): cambiar color al del theme
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
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
          celda: <DateTime>(DateTime value) {
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
                        // TODO(mati): pasarle la fecha al text
                        '01 Aug 2023',
                        // DateFormat.yMd().format(value),
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
          celda: <String>(value) {
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
        ModeloLista<String>(
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
          celda: <String>(value) {
            return SizedBox(
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
                        IconButton(
                          onPressed: () {
                            // TODO(anyone): agregarle funcionalidad
                          },
                          icon: Icon(
                            Icons.more_vert_outlined,
                            size: 18.pf,
                            color: colores.primary,
                          ),
                        ),
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
