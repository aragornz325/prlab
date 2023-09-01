import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/administracion_contenido/bloc/bloc_administracion_contenido.dart';
import 'package:prlab_flutter/features/dashboard/administracion_contenido/escritorio/vista_escritorio_administracion_contenido.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaAdministracionContenido}
/// Página para gestionar la administración de contenidos o la creación de uno
/// nuevo con ciertas características dada por la pagina.
/// {@endtemplate}
@RoutePage()
class PaginaAdministracionContenido extends StatelessWidget {
  /// {@macro PaginaAdministracionContenido}
  const PaginaAdministracionContenido({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocAdministracionContenido>(
      create: (context) => BlocAdministracionContenido(),
      child: const FullResponsiveScreen(
        desktop: VistaEscritorioAdministracionContenido(),
        mobile: VistaEscritorioAdministracionContenido(),
      ),
    );
  }
}
