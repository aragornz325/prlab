import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
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
  const PaginaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
      body: AutoRouter(
        builder: (context, content) {
          return PRWrapperNavegacion(
            body: content,
            onTap: (menuDeOpciones) {
              // TODO(Anyone): Agregar rutas y cuando esten todas pasar a switch
              if (menuDeOpciones case MenuDeOpciones.yourArticles) {
                context.router.push(const RutaAdministracionContenido());
              } else if (menuDeOpciones case MenuDeOpciones.createArticle) {
                context.router.push(
                  RutaEditorContenido(idArticulo: 0),
                );
                // TODO(anyone): pasar el id correcto
              } else {
                showDialog<void>(
                  context: context,
                  builder: (context) => const PRDialogErrorNoDisponible(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
