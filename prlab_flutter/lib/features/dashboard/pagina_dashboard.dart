import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

// TODO(anyone):
// Esto esta para poder redirigir al usuario desde el login
// a algun especie de dashboard, para poder continuar el flujo
// de las tareas del primer sprint, una vez que se cree
// verdadero dashboard, eliminar este!
@RoutePage()
class PaginaDashboard extends StatelessWidget {
  const PaginaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullResponsiveScreen(
      mobile: Scaffold(
        body: Center(
          child: Text('Estará disponible en la próxima versión'),
        ),
      ),
      desktop: Scaffold(
        body: Center(
          child: Text('Estará disponible en la próxima versión'),
        ),
      ),
    );
  }
}
