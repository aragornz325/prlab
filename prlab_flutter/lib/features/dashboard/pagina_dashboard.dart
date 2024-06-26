import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/features/dashboard/bloc/bloc_dashboard.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/bloc/bloc_drawer.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/widgets/wrapper_navegacion/pr_wrapper_navegacion.dart';

/// {@template PaginaDashboard}
/// Pagina padre donde se manejan todas las rutas del usuario
/// una vez logueado, el body se va a dibujar segun la ruta en
/// la que se encuentre en este momento.
/// {@endtemplate}
@RoutePage()
class PaginaDashboard extends StatelessWidget {
  /// {@macro PaginaDashboard}
  const PaginaDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDrawer>(
          create: (context) => BlocDrawer(),
        ),
        BlocProvider<BlocDashboard>(
          create: (context) => BlocDashboard(),
        ),
      ],
      child: BlocListener<BlocDashboard, BlocDashboardEstado>(
        listener: (context, state) {
          if (state is BlocDashboardExitoso) {
            context.router.push(
              RutaEditorContenido(idArticulo: state.idArticulo),
            );
          }

          if (state is BlocDashboardEstadoFaltaCompletarKyc) {
            context.router.push(
              RutaKyc(
                idUsuario: sessionManager.signedInUser?.id ?? 0,
              ),
            );
          }
        },
        child: AutoRouter(
          builder: (context, content) {
            return PRWrapperNavegacion(
              body: content,
              onTap: (menuDeOpciones) {
                switch (menuDeOpciones) {
                  // TODO(Anyone): Agregar rutas faltantes
                  case MenuDeOpciones.yourArticles:
                    context.router.push(const RutaAdministracionContenido());
                  case MenuDeOpciones.databaseMedia:
                    context.router.push(const RutaDbMediosDeComunicacion());
                  case MenuDeOpciones.createReport:
                  case MenuDeOpciones.projects:
                  case MenuDeOpciones.dashboards:
                  case MenuDeOpciones.helpCenter:
                  case MenuDeOpciones.contactSupport:
                  case MenuDeOpciones.prLabWeb:
                  case MenuDeOpciones.prLabNewsroom:
                  case MenuDeOpciones.productUpdate:
                  case MenuDeOpciones.accountSettings:
                  case MenuDeOpciones.payments:
                  case MenuDeOpciones.users:
                  case MenuDeOpciones.emailSetup:
                  case MenuDeOpciones.activityHistory:
                  case MenuDeOpciones.profile:
                  case MenuDeOpciones.changeAccount:
                  case MenuDeOpciones.signOut:
                    showDialog<void>(
                      context: context,
                      builder: (context) => const PRDialogErrorNoDisponible(),
                    );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
