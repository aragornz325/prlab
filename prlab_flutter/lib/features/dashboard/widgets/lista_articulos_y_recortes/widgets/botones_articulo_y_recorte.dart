import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template BotonesArticulosYRecorte}
/// Son dos botones de `artículos` y `recorte` donde se tendría que navegar
/// entre dos vistas.
/// {@endtemplate}
class BotonesArticulosYRecorte extends StatelessWidget {
  /// {@macro BotonesArticulosYRecorte}
  const BotonesArticulosYRecorte({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.pw,
        vertical: 20.ph,
      ),
      child: BlocBuilder<BlocListaArticulosYRecortes,
          BlocListaArticulosYRecortesEstado>(
        builder: (context, state) {
          return Row(
            children: [
              BotonConIcono(
                colorIcono:
                    state.esArticulos ? colores.primary : colores.secondary,
                colorTexto:
                    state.esArticulos ? colores.primary : colores.secondary,
                icono: Icons.article_outlined,
                onTap: () {
                  context.read<BlocListaArticulosYRecortes>().add(
                        const BlocListaArticulosYRecortesEventoSeleccion(
                          index: 0,
                        ),
                      );
                },
                textoBoton: l10n.commonArticles,
              ),
              SizedBox(width: 40.pw),
              BotonConIcono(
                colorIcono:
                    state.esRecortes ? colores.primary : colores.secondary,
                colorTexto:
                    state.esRecortes ? colores.primary : colores.secondary,
                icono: Icons.image_outlined,
                onTap: () {
                  context.read<BlocListaArticulosYRecortes>().add(
                        const BlocListaArticulosYRecortesEventoSeleccion(
                          index: 1,
                        ),
                      );
                },
                textoBoton:
                    l10n.pageContentAdministrationButtonNavegationClippings,
              ),
            ],
          );
        },
      ),
    );
  }
}
