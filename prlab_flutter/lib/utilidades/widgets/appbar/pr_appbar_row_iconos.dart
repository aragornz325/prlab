import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PRAppBarRowIconos}
/// Componente de PRAppBar el cual contiene los items que se muestran con icono
/// {@endtemplates}
class PRAppBarRowIconos extends StatefulWidget {
  /// {@macro PRAppBarRowIconos}
  const PRAppBarRowIconos({
    required this.onTap,
    super.key,
  });

  /// Función utilizada para enviar y recibir un value de tipo MenuDeOpciones.
  final void Function(MenuDeOpciones value) onTap;

  @override
  State<PRAppBarRowIconos> createState() => _PRAppBarRowIconosState();
}

class _PRAppBarRowIconosState extends State<PRAppBarRowIconos> {
  bool estaListaDeOpcionesDesplegado = false;
  bool estaConfiguracionDesplegada = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      decoration: BoxDecoration(color: colores.surfaceTint),
      child: Row(
        children: [
          // TODO(anyone): Descomentar cuando se use el drawer
          // PopupMenuButton<MenuDeOpciones>(
          //   onOpened: () {
          //     setState(() {
          //       estaListaDeOpcionesDesplegado = true;
          //     });
          //   },
          //   onCanceled: () {
          //     setState(() {
          //       estaListaDeOpcionesDesplegado = false;
          //     });
          //   },
          //   tooltip: '',
          //   itemBuilder: (BuildContext context) {
          //     return MenuDeOpciones.opciones.map((enumOpciones) {
          //       return PopupMenuItem<MenuDeOpciones>(
          //         onTap: () => widget.onTap(enumOpciones),
          //         value: enumOpciones,
          //         child: Text(
          //           enumOpciones.nombreItem(context),
          //           style: TextStyle(
          //             fontSize: 14.pf,
          //             color: colores.tertiary,
          //           ),
          //         ),
          //       );
          //     }).toList();
          //   },
          //   constraints: BoxConstraints(minWidth: 180.pw),
          //   position: PopupMenuPosition.under,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20.sw),
          //   ),
          //   child: CircleAvatar(
          //     radius: 26.sw,
          //     backgroundColor: estaListaDeOpcionesDesplegado
          //         ? colores.primaryOpacidadVeinte
          //         : colores.surfaceTint,
          //     child: Icon(
          //       Icons.more_vert,
          //       color: colores.primary,
          //       size: 30.pw,
          //     ),
          //   ),
          // ),
          // TODO(anyone): Eliminar cuando se use el drawer
          GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const PRDialogErrorNoDisponible();
                },
              );
            },
            child: Icon(
              Icons.more_vert,
              size: 35,
              color: colores.primary,
            ),
          ),
          SizedBox(width: 30.pw),
          // TODO(anyone): Descomentar cuando se use el drawer
          // PopupMenuButton<MenuDeOpciones>(
          //   onOpened: () {
          //     setState(() {
          //       estaConfiguracionDesplegada = true;
          //     });
          //   },
          //   onCanceled: () {
          //     setState(() {
          //       estaConfiguracionDesplegada = false;
          //     });
          //   },
          //   tooltip: '',
          //   itemBuilder: (BuildContext context) {
          //     return MenuDeOpciones.configuraciones.map((enumConfiguraciones) {
          //       return PopupMenuItem<MenuDeOpciones>(
          //         value: enumConfiguraciones,
          //         onTap: () => widget.onTap(enumConfiguraciones),
          //         child: Text(
          //           enumConfiguraciones.nombreItem(context),
          //           style: TextStyle(
          //             fontSize: 14.pf,
          //             color: colores.tertiary,
          //           ),
          //         ),
          //       );
          //     }).toList();
          //   },
          //   constraints: BoxConstraints(minWidth: 180.pw),
          //   position: PopupMenuPosition.under,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20.sw),
          //   ),
          //   child: CircleAvatar(
          //     radius: 26.sw,
          //     backgroundColor: estaConfiguracionDesplegada
          //         ? colores.primaryOpacidadVeinte
          //         : colores.surfaceTint,
          //     child: Icon(
          //       Icons.settings_outlined,
          //       color: colores.primary,
          //       size: 30.pw,
          //     ),
          //   ),
          // ),
          // TODO(anyone): Eliminar cuando se use el drawer
          GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const PRDialogErrorNoDisponible();
                },
              );
            },
            child: Icon(
              Icons.settings_outlined,
              size: 35,
              color: context.colores.primary,
            ),
          ),
          SizedBox(width: 30.pw),
          // TODO(anyone): Descomentar cuando se use el drawer
          // PopupMenuButton<MenuDeOpciones>(
          //   itemBuilder: (BuildContext context) {
          //     return <PopupMenuEntry<MenuDeOpciones>>[
          //       PopupMenuItem(
          //         enabled: false,
          //         child: Row(
          //           children: [
          //             SizedBox(
          //               width: 25.pw,
          //               height: max(25.ph, 25.sh),
          //               child: Image.asset(
          //                 Assets.assets_icons_apartment_png,
          //               ),
          //             ),
          //             SizedBox(width: 5.pw),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   // TODO(Anyone): datos de user
          //                   'PR Lab',
          //                   style: TextStyle(
          //                     height: .7.ph,
          //                     fontSize: 14.pf,
          //                     color: colores.tertiary,
          //                   ),
          //                 ),
          //                 Text(
          //                   '${sessionManager.signedInUser?.userName ?? 'John'}'
          //                   ' - Owner',
          //                   style: TextStyle(
          //                     fontSize: 14.pf,
          //                     color: colores.secondary,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //       PopupMenuDivider(height: max(.5.ph, .5.sh)),
          //       ...MenuDeOpciones.perfil.map((enumPerfil) {
          //         return PopupMenuItem<MenuDeOpciones>(
          //           onTap: () => widget.onTap(enumPerfil),
          //           value: enumPerfil,
          //           child: Text(
          //             enumPerfil.nombreItem(context),
          //             style: TextStyle(
          //               fontSize: 14.pf,
          //               color: colores.tertiary,
          //             ),
          //           ),
          //         );
          //       }),
          //     ];
          //   },
          //   constraints: BoxConstraints(minWidth: 180.pw),
          //   position: PopupMenuPosition.under,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20.sw),
          //   ),
          //   child: CircleAvatar(
          //     maxRadius: 20.pw,
          //     backgroundColor: colores.outlineVariant,
          //   ),
          // ),
          // TODO(anyone): Eliminar cuando se use el drawer
          GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const PRDialogErrorNoDisponible();
                },
              );
            },
            child: Icon(
              Icons.circle,
              size: 55,
              color: colores.outline,
            ),
          ),
        ],
      ),
    );
  }
}
