import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/celular/vista_administracion_marcas.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/vista_administracion_marcas.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template VistaEscritorioAdministracionMarcas}
/// Pagina de administracion de marcas donde el usuario puede ver sus marcas e
/// informacion de las mismas
/// {@endtemplate}
@RoutePage()
class PaginaAdministracionMarcas extends StatelessWidget {
  /// {@macro PaginaAdministracionMarcas}
  const PaginaAdministracionMarcas({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocAdministracionMarcas(),
        ),
      ],
      child: const FullResponsiveScreen(
        mobile: VistaCelularAdministracionMarcas(),
        desktop: VistaEscritorioAdministracionMarcas(),
      ),
    );
  }
}
