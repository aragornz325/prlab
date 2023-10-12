import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_creacion_periodista/bloc_creacion_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_filtrado_periodistas/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/dialog/dialog_cancelar_creacion_de_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/nada_para_ver.dart';

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
          if (state is BlocDbMediosDeComunicacionEstadoCargandoFiltros) {
            return SizedBox(
              height: 605.ph,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state.periodistas.isEmpty) {
            return SizedBox(
              height: max(605.ph, 605.sh),
              child: const Center(
                child: NadaParaVer(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.commonResults,
                      style: TextStyle(
                        color: colores.secondary,
                        fontSize: 14.pf,
                      ),
                    ),
                    InkWell(
                      onTap: () => showDialog<void>(
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<BlocCreacionPeriodista>(),
                            child: const PRDialogConfirmarSiHayData(),
                          );
                        },
                      ),
                      child: Row(
                        children: [
                          Text(
                            // TODO(SAM/GON): Revisar diseño
                            l10n.pageMediaDatabaseAddJournalistButton,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: colores.secondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              SizedBox(
                height: max(624.ph, 624.sh),
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
