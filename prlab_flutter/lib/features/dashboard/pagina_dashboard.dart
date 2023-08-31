import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/utilidades/widgets/wrapper_navegacion/pr_wrapper.dart';

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
      // TODO(Manu):
      // Este Scaffold es que debería ser parte del componente de navegación
      // ya que esta seteado con la logica de AutoRoute para manejar las
      // rutas anidadas.
      body: AutoRouter(
        builder: (context, content) {
          return PRWrapperNavegacion(
            body: content,
          );
        },
      ),
    );
  }
}
