import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/encabezado_de_seccion.dart';

/// {@template VistaEscritorioDbMediosDeComunicacion}
/// Vista de escritorio de búsqueda de medios de comunicación,
/// muestra una lista de `journalists` para eventualmente
/// seleccionar en el contacto y sacar los datos del
/// periodista.
///
/// Contiene una variedad de filtros de búsqueda
/// como países, cuidades, entre otras cosas.
/// {@endtemplate}
class VistaEscritorioDbMediosDeComunicacion extends StatelessWidget {
  /// {@macro VistaEscritorioDbMediosDeComunicacion}
  const VistaEscritorioDbMediosDeComunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EncabezadoDeSeccion(
            icono: Icons.manage_search_rounded,
            titulo: l10n.pageMediaDatabaseTitle,
            descripcion: l10n.pageMediaDatabaseDescription,
          ),
          SizedBox(height: 20.ph),
          const MenuBarraHorizontal(),
          SizedBox(height: 30.ph),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FiltradorDePeriodistas(),
              ListadoDePeriodistas(),
            ],
          ),
          SizedBox(height: 85.ph),
        ],
      ),
    );
  }
}

class ListadoDePeriodistas extends StatelessWidget {
  const ListadoDePeriodistas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return BlocBuilder<BlocDbMediosDeComunicacion,
        BlocDbMediosDeComunicacionEstado>(
      builder: (context, state) {
        return Container(
          width: 605.ph,
          margin: EdgeInsets.only(right: 30.pw),
          decoration: BoxDecoration(color: colores.surfaceTint),
          child: Column(
            children: [
              SizedBox(
                height: 64.ph,
                child: const Text('Influence score'),
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
          ),
        );
      },
    );
  }
}
