import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template TarjetaMarca}
/// Tarjeta de la marca donde se muestran la informacion de la misma
/// {@endtemplate}
class TarjetaMarca extends StatelessWidget {
  /// {@macro TarjetaMarca}
  const TarjetaMarca({
    required this.linkMarca,
    required this.nombreMarca,
    required this.linksArticulos,
    super.key,
  });

  /// Link a la web de la marca
  final String linkMarca;

  /// Nombre de la marca
  final String nombreMarca;

  /// Links a los articulos de la marca
  final List<String> linksArticulos;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Container(
      width: 485.pw,
      height: 370.ph,
      color: colores.onPrimary,
      child: Column(
        children: [
          Container(
            height: 64.ph,
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
                      size: 20.pf,
                    ),
                    SizedBox(width: 5.pw),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(linkMarca)),
                      child: Text(
                        linkMarca,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.pf,
                          color: colores.primaryContainer,
                          decoration: TextDecoration.underline,
                          decorationColor: colores.primaryContainer,
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.settings_outlined,
                  color: colores.primary,
                  size: 24.pf,
                )
              ],
            ),
          ),
          Divider(
            thickness: .2,
            height: 1,
            color: colores.secondary,
          ),
          Container(
            height: 90.ph,
            padding: EdgeInsets.symmetric(
              vertical: 20.ph,
              horizontal: 20.pw,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nombreMarca,
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
                        // TODO(onyone): Agregar funcion 'lista' o popup de feature in progress
                        showDialog<void>(
                          context: context,
                          builder: (context) =>
                              const PRDialogErrorNoDisponible(),
                        );
                      },
                      texto: l10n.commonList,
                      estaHabilitado: true,
                      width: 100.pw,
                      height: 30.ph,
                    ),
                    SizedBox(width: 20.pw),
                    PRBoton(
                      onTap: () {
                        // TODO(onyone): Agregar funcion 'crear' o popup de feature in progress
                        showDialog<void>(
                          context: context,
                          builder: (context) =>
                              const PRDialogErrorNoDisponible(),
                        );
                      },
                      texto: l10n.commonCreate,
                      estaHabilitado: true,
                      width: 100.pw,
                      height: 30.ph,
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: .2,
            height: 1,
            color: colores.secondary,
          ),
          Container(
            height: 205.ph,
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
                      height: 135.ph,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.ph,
                          );
                        },
                        itemCount: linksArticulos.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 10.pw,
                                height: 10.ph,
                                decoration: BoxDecoration(
                                  color: colores.secondary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5.pw),
                              GestureDetector(
                                onTap: () {
                                  // TODO(onyone): Agregar funcion al apretar link
                                  showDialog<void>(
                                    context: context,
                                    builder: (context) =>
                                        const PRDialogErrorNoDisponible(),
                                  );
                                },
                                child: Text(
                                  linksArticulos[index],
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
