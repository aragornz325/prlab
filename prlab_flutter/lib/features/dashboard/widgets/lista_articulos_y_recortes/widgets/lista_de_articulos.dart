// ignore_for_file: inference_failure_on_instance_creation

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/popup/popup.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';
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

  // hacer el init que filtre por un enum de filtro
  /// Lista de los artículos para mostrar sus propiedades
  final List<EntregableArticulo> articulos;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Grilla(
      listaColumnas: [
        // Articulo
        Columna(
          widthDeLaColumna: 400.pw,
          lista: articulos.map((e) => e.titulo).toList(),
          nombreColumna: l10n.commonArticles,
          celdaEncabezadoColumna: (value) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.ph,
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
                      Divider(color: colores.outlineVariant),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            );
          },
        ),

        //estado
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.idStatus).toList(),
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
                          color: devolverColorDependiendoDelEstado(
                            context: context,
                            numero: value,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.sw),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            devolverNombreDelEstado(
                              context: context,
                              numero: value,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: colores.surfaceTint,
                              fontSize: 15.pf,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(color: colores.outlineVariant),
                ],
              ),
            );
          },
        ),

        // Fecha
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.ultimaModificacion).toList(),
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
                  Divider(color: colores.outlineVariant),
                ],
              ),
            );
          },
        ),

        // Autor
        Columna(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.contenido).toList(),
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
                        radius: 15.sw,
                        backgroundColor: colores.outlineVariant,
                        child: CircleAvatar(
                          radius: 15.sw,
                          backgroundColor: colores.outlineVariant,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: colores.outlineVariant),
                ],
              ),
            );
          },
        ),

        // botones
        Columna<int>(
          widthDeLaColumna: 150.pw,
          lista: articulos.map((e) => e.id!).toList(),
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
                            showDialog<void>(
                              context: context,
                              builder: (context) =>
                                  const PRDialogErrorNoDisponible(),
                            );
                          },
                          icon: Icon(
                            Icons.share_outlined,
                            size: 18.pw,
                            color: colores.primary,
                          ),
                        ),
                        PopUpMenuOpcionesArticulo(idArticulo: value),
                        SizedBox(width: 10.pw),
                      ],
                    ),
                  ),
                  Divider(color: colores.outlineVariant),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Devuelve una cadena que representa el nombre del estado
/// según el "número" dado.
String devolverNombreDelEstado({
  required int numero,
  required BuildContext context,
}) {
  final l10n = context.l10n;

  return switch (numero) {
    1 => l10n.commonDraft,
    2 => l10n.commonFeedback,
    3 => l10n.commonApproved,
    4 => l10n.commonSchedule,
    5 => l10n.commonPublished,
    _ => '',
  };
}

/// Devuelve un `Color` basado en el valor de `numero` y
/// los colores del tema definidos en `BuildContext`.
Color devolverColorDependiendoDelEstado({
  required int numero,
  required BuildContext context,
}) {
  final colores = context.colores;

  return switch (numero) {
    1 => colores.secondary,
    2 => colores.onTertiary,
    3 => colores.primaryContainer,
    4 => colores.onSurfaceVariant,
    5 => colores.onTertiaryContainer,
    _ => colores.secondary,
  };
}
