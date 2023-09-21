import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/bloc/bloc_dashboard.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template TarjetaMarca}
/// Tarjeta de la marca donde se muestran la informacion de la misma
/// {@endtemplate}
class TarjetaMarca extends StatelessWidget {
  /// {@macro TarjetaMarca}
  const TarjetaMarca({
    required this.marca,
    super.key,
  });

  final Marca marca;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Container(
      width: 485.pw,
      height: max(398.ph, 398.sh),
      color: colores.surfaceTint,
      child: Column(
        children: [
          Container(
            height: max(64.ph, 64.sh),
            padding: EdgeInsets.symmetric(
              vertical: 20.ph,
              horizontal: 20.pw,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: colores.tertiary,
                      size: 20.pw,
                    ),
                    SizedBox(width: 5.pw),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(marca.sitioWeb)),
                      child: Text(
                        marca.sitioWeb,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.pf,
                          color: colores.primaryContainer,
                          decoration: TextDecoration.underline,
                          decorationColor: colores.primaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // TODO(anyone): agregarle funcionalidad
                    showDialog<void>(
                      context: context,
                      builder: (context) => const PRDialogErrorNoDisponible(),
                    );
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: colores.primary,
                    size: 24.pw,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: .2,
            height: 1.sh,
            color: colores.secondary,
          ),
          Container(
            height: max(90.ph, 90.sh),
            padding: EdgeInsets.symmetric(
              vertical: 20.ph,
              horizontal: 20.pw,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  marca.nombre,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.pf,
                    color: colores.tertiary,
                  ),
                ),
                Row(
                  children: [
                    PRBoton.esOutlined(
                      onTap: () {
                        final idMarca = marca.id;
                        if (idMarca == null) return;

                        context.router.push(
                          RutaAdministracionDeUnaMarca(
                            idMarca: idMarca,
                          ),
                        );
                      },
                      texto: l10n.commonList,
                      estaHabilitado: true,
                      width: 100.pw,
                      height: max(30.ph, 30.sh),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: 20.pw),
                    PRBoton(
                      onTap: () {
                        context.read<BlocDashboard>().add(
                              BlocDashboardEventoCrearArticulo(
                                marca: marca,
                              ),
                            );
                      },
                      texto: l10n.commonCreate,
                      estaHabilitado: true,
                      width: 100.pw,
                      height: max(30.ph, 30.sh),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: .2,
            height: 1.sh,
            color: colores.secondary,
          ),
          Container(
            height: max(205.ph, 205.sh),
            padding: EdgeInsets.symmetric(
              vertical: 20.ph,
              horizontal: 20.pw,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.pageBrandAdministrationRecentlyModifiedText,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.pf,
                        color: colores.secondary,
                      ),
                    ),
                    SizedBox(
                      height: 5.ph,
                    ),
                    SizedBox(
                      width: 445.pw,
                      height: max(135.ph, 135.sh),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: max(1.ph, 1.sh),
                          );
                        },
                        itemCount: marca.ultimosArticulos?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 5.ph,
                                  right: 2.pw,
                                ),
                                child: Container(
                                  width: 10.pw,
                                  height: max(10.ph, 10.sh),
                                  decoration: BoxDecoration(
                                    color: colores.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final idArticulo =
                                      marca.ultimosArticulos?[index].id;

                                  if (idArticulo == null) return;

                                  context.router.push(
                                    RutaEditorContenido(idArticulo: idArticulo),
                                  );
                                },
                                child: SizedBox(
                                  width: 430.pw,
                                  height: max(25.ph, 25.sh),
                                  child: Text(
                                    marca.ultimosArticulos?[index].titulo ?? '',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.pf,
                                      color: colores.primary,
                                      decoration: TextDecoration.underline,
                                      overflow: TextOverflow.ellipsis,
                                      decorationColor: colores.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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
