import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

class ContainerBusqueda extends StatelessWidget {
  const ContainerBusqueda({
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
      height: 264.ph,
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
          SizedBox(height: 20.ph),
          Text(
            l10n.pageHomeContainerBusquedaTitle(nombreUsuario),
            style: TextStyle(
              fontSize: 30.pf,
              color: colores.background,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.ph),
          Container(
            width: 542.pw,
            height: 50.ph,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
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
                    size: 25.pf,
                  ),
                ),
                hintText: l10n.pageHomeContainerBusquedaPlaceholder,
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 17.pf),
            ),
          ),
          SizedBox(height: 15.ph),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemMediaDatabase,
                icono: Icons.explore_outlined,
                estaCargando: true,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemContacts,
                icono: Icons.ballot_outlined,
                estaCargando: true,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemOnlineNewsroom,
                icono: Icons.telegram,
                estaCargando: true,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemPRReports,
                icono: Icons.donut_small,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemAnalytic,
                icono: Icons.account_tree_outlined,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemMediaMonitoring,
                icono: Icons.monitor_heart_outlined,
              ),
              ItemContainerBusqueda(
                texto: l10n.pageHomeContainerBusquedaItemStatistics,
                icono: Icons.monitor,
              ),
            ],
          ),
          SizedBox(height: 15.ph),
        ],
      ),
    );
  }
}
