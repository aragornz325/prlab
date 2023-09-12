import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template ListadoDePeriodistas}
/// Contiene una lista de periodistas representados en cartas
/// con el componente [PRCardPeriodista].
/// {@endtemplate}
class ListadoDePeriodistas extends StatelessWidget {
  /// {@macro ListadoDePeriodistas}
  const ListadoDePeriodistas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Container(
      width: 605.ph,
      margin: EdgeInsets.only(right: 30.pw),
      decoration: BoxDecoration(color: colores.surfaceTint),
      child: BlocBuilder<BlocDbMediosDeComunicacion,
          BlocDbMediosDeComunicacionEstado>(
        builder: (context, state) {
          if (state is BlocDbMediosDeComunicacionEstadoCargando) {
            return const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state.periodistas.isEmpty) {
            return SizedBox(
              child: Center(
                child: Image.asset(
                  Assets.assets_images_nada_para_ver_png,
                ),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 25.ph,
                  horizontal: 24.pw,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      l10n.pageMediaDatabaseJournalistListTopLabel,
                      style: TextStyle(
                        color: colores.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          const PRDialogErrorNoDisponible().show(context),
                      child: Icon(
                        Icons.unfold_more_outlined,
                        color: colores.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              SizedBox(
                height: 624.ph,
                width: 560.pw,
                child: ListView.builder(
                  itemCount: state.periodistas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PRCardPeriodista(
                      periodista: state.periodistas[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
