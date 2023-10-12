import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_creacion_periodista/bloc_creacion_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_filtrado_periodistas/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/celular/vista_celular_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/escritorio/vista_escritorio_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PaginaDbMediosDeComunicacion}
/// Página de búsqueda de medios de comunicación, muestra
/// una lista de `journalists` para eventualmente
/// seleccionar en el contacto y sacar los datos del
/// periodista.
///
/// Contiene una variedad de filtros de búsqueda
/// como países, cuidades, entre otras cosas.
/// {@endtemplate}
@RoutePage()
class PaginaDbMediosDeComunicacion extends StatelessWidget {
  /// {@macro PaginaDbMediosDeComunicacion}
  const PaginaDbMediosDeComunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocCreacionPeriodista(),
        ),
        BlocProvider(
          create: (context) => BlocDbMediosDeComunicacion(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<BlocDbMediosDeComunicacion,
              BlocDbMediosDeComunicacionEstado>(
            listener: (context, state) {
              if (state.estaActualizandoFiltros) {
                actualizarFiltrosYObtenerPeriodistas(context: context);
              }
            },
          ),
          BlocListener<BlocCreacionPeriodista, BlocCreacionPeriodistaEstado>(
            listener: (context, state) {
              if (state.seCreoElPeriodista) {
                actualizarFiltrosYObtenerPeriodistas(context: context);
                showDialog<void>(
                  context: context,
                  builder: (context) => PRDialog.exito(
                    height: 200.ph,
                    context: context,
                    onTap: () => Navigator.of(context).pop(),
                    descripcion:
                        l10n.pageMediaDatabaseJournalistAddedSuccesfully,
                  ),
                );
              }
            },
          ),
        ],
        child: const FullResponsiveScreen(
          mobile: VistaCelularDbMediosDeComunicacion(),
          desktop: VistaEscritorioDbMediosDeComunicacion(),
        ),
      ),
    );
  }

  /// Se llama cuando se actualiza un filtro (agrega o quita)
  void actualizarFiltrosYObtenerPeriodistas({required BuildContext context}) {
    context.read<BlocDbMediosDeComunicacion>().add(
          BlocDbMediosDeComunicacionEventoObtenerPeriodistas(),
        );

    context.read<BlocDbMediosDeComunicacion>().add(
          BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros(),
        );
  }
}
