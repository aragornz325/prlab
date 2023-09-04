import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';

/// {@template PRAppBarRowIconos}
/// Componente de PRAppBar el cual contiene los items que se muestran con icono
/// {@endtemplates}
class PRAppBarRowIconos extends StatelessWidget {
  /// {@macro PRAppBarRowIconos}
  const PRAppBarRowIconos({
    required this.onTap,
    super.key,
  });

  /// Función utilizada para enviar y recibir un value de tipo MenuDeOpciones.
  final void Function(MenuDeOpciones value) onTap;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Container(
      decoration: BoxDecoration(color: colores.surfaceTint),
      child: Row(
        children: [
          PopupMenuButton<MenuDeOpciones>(
            icon: Icon(
              Icons.more_vert,
              color: colores.primary,
              size: 30.pf,
            ),
            itemBuilder: (BuildContext context) {
              return MenuDeOpciones.opciones.map((enumOpciones) {
                return PopupMenuItem<MenuDeOpciones>(
                  onTap: () => onTap(enumOpciones),
                  value: enumOpciones,
                  child: Text(
                    enumOpciones.nombreItem(context),
                    style: TextStyle(fontSize: 14.pf),
                  ),
                );
              }).toList();
            },
            constraints: BoxConstraints(minWidth: 180.pw),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 30.pw),
          PopupMenuButton<MenuDeOpciones>(
            icon: Icon(
              Icons.settings_outlined,
              color: colores.primary,
              size: 30.pf,
            ),
            itemBuilder: (BuildContext context) {
              return MenuDeOpciones.configuraciones.map((enumConfiguraciones) {
                return PopupMenuItem<MenuDeOpciones>(
                  value: enumConfiguraciones,
                  onTap: () => onTap(enumConfiguraciones),
                  child: Text(
                    enumConfiguraciones.nombreItem(context),
                    style: TextStyle(fontSize: 14.pf),
                  ),
                );
              }).toList();
            },
            constraints: BoxConstraints(minWidth: 180.pw),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 30.pw),
          PopupMenuButton<MenuDeOpciones>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<MenuDeOpciones>>[
                PopupMenuItem(
                  enabled: false,
                  child: Row(
                    children: [
                      Icon(
                        Icons.apartment,
                        color: colores.primary,
                        size: 24.pf,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // TODO(Anyone): datos de user

                            'PR Lab',
                            style: TextStyle(
                              fontSize: 14.pf,
                              color: colores.tertiary,
                            ),
                          ),
                          Text(
                            // TODO(Anyone): datos de user
                            'John Smith - Owner',
                            style: TextStyle(
                              fontSize: 14.pf,
                              color: colores.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuDivider(height: 0.5.ph),
                ...MenuDeOpciones.perfil.map((enumPerfil) {
                  return PopupMenuItem<MenuDeOpciones>(
                    onTap: () => onTap(enumPerfil),
                    value: enumPerfil,
                    child: Text(
                      enumPerfil.nombreItem(context),
                      style: TextStyle(fontSize: 14.pf),
                    ),
                  );
                }),
              ];
            },
            constraints: BoxConstraints(minWidth: 180.pw),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CircleAvatar(
              maxRadius: 20.pw,
              backgroundColor: colores.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
