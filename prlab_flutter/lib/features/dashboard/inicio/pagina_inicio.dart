import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/inicio/bloc/bloc_inicio.dart';
import 'package:prlab_flutter/features/dashboard/inicio/celular/vista_inicio.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/vista_inicio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaInicio}
/// Pagina del Inicio del dashboard, seccion que el usuario ve cuando inicia
/// sesión
/// {@endtemplate}
@RoutePage()
class PaginaInicio extends StatelessWidget {
  /// {@macro PaginaInicio}
  const PaginaInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocInicio()..add(BlocInicioEventoInicializar()),
      child: const FullResponsiveScreen(
        mobile: VistaCelularInicio(),
        desktop: VistaEscritorioInicio(),
      ),
    );
  }
}
