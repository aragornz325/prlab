import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/inicio/bloc/bloc_inicio.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:shimmer/shimmer.dart';

/// {@template ContainerBusqueda}
/// Seccion donde hay una barra de busqueda e items de categorias
/// {@endtemplate}
class ContenedorDeLaBarraDeBusqueda extends StatelessWidget {
  /// {@macro ContainerBusqueda}
  const ContenedorDeLaBarraDeBusqueda({
    required this.nombreUsuario,
    super.key,
  });

  /// Nombre del usuario logeado
  final String nombreUsuario;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Container(
      width: 1010.pw,
      height: max(264.ph, 264.sh),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            colores.gradientContainerBusqueda,
            colores.primary,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: max(20.ph, 20.sh)),
          Text(
            l10n.pageHomeContainerBusquedaTitle(nombreUsuario),
            style: TextStyle(
              fontSize: 30.pf,
              color: colores.background,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: max(15.ph, 15.sh)),
          Container(
            width: 542.pw,
            height: max(50.ph, 50.sh),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sw),
              ),
              color: colores.background,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefix: SizedBox(
                  width: 5.pw,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5.pw),
                  child: Icon(
                    Icons.manage_search_outlined,
                    size: 25.pw,
                    color: colores.secondary,
                  ),
                ),
                hintText: l10n.pageHomeContainerBusquedaPlaceholder,
                hintStyle: TextStyle(
                  color: colores.secondary,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 17.pf),
            ),
          ),
          SizedBox(height: max(15.ph, 15.sh)),
          BlocBuilder<BlocInicio, BlocInicioEstado>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemMediaDatabase,
                    icono: Icons.explore_outlined,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemContacts,
                    icono: Icons.ballot_outlined,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemOnlineNewsroom,
                    iconImage: Assets.assets_icons_contrato_png,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemPRReports,
                    icono: Icons.donut_small,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemAnalytic,
                    icono: Icons.account_tree_outlined,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemMediaMonitoring,
                    iconImage: Assets.assets_icons_signos_vitales_png,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                  _ItemContenedorDeLaBarraDeBusqueda(
                    texto: l10n.pageHomeContainerBusquedaItemStatistics,
                    iconImage: Assets.assets_icons_metricas_png,
                    estaCargando: state.estaEnEstadoCargando,
                    onTap: () {
                      // TODO(Gon): Agregar pusheo a la ruta correspondiente
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: max(15.ph, 15.sh)),
        ],
      ),
    );
  }
}

/// {@template ItemContainerBusqueda}
/// Item de categoria en el container con barra de busqueda
/// {@endtemplate}
class _ItemContenedorDeLaBarraDeBusqueda extends StatelessWidget {
  /// {@macro ItemContainerBusqueda}
  const _ItemContenedorDeLaBarraDeBusqueda({
    required this.texto,
    required this.onTap,
    this.icono,
    this.iconImage,
    this.estaCargando = false,
  });

  /// Texto bajo el container con icono
  final String texto;

  /// Icono dentro del container
  final IconData? icono;

  // Path de la imagen a usar como icono dentro del container
  final String? iconImage;

  /// Indica si esta cargando para mostrar un CircularProgressIndicator
  final bool estaCargando;

  /// Función a realizar en el momento de apretar el item
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60.sw,
            height: 60.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sw),
              ),
              color: colores.background,
            ),
            child: Center(
              child: estaCargando
                  ? SizedBox(
                      width: 20.sw,
                      height: max(20.ph, 20.sh),
                      child: CircularProgressIndicator(
                        color: colores.secondary,
                      ),
                    )
                  : icono != null
                      ? Icon(
                          icono,
                          size: 25.pw,
                          color: colores.primary,
                        )
                      : iconImage != null
                          ? Image.asset(
                              iconImage!,
                              fit: BoxFit.cover,
                              height: max(30.ph, 30.sh),
                            )
                          : Container(),
            ),
          ),
        ),
        SizedBox(height: max(5.ph, 5.sh)),
        if (estaCargando)
          SizedBox(
            width: 40.pw,
            height: max(10.ph, 10.sh),
            child: Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: colores.primary,
              highlightColor: colores.surfaceTintOpacidadSetenta,
              child: Container(
                width: 50.pw,
                height: max(10.ph, 10.sh),
                color: colores.surfaceTintOpacidadCuarenta,
              ),
            ),
          )
        else
          Text(
            texto,
            style: TextStyle(
              fontSize: 12.pf,
              color: colores.background,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
