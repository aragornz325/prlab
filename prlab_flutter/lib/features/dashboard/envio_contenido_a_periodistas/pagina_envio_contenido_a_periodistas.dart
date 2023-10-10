import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/bloc/bloc_envio_contenido_a_periodistas.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/celular/vista_envio_contenido_a_periodistas_celular.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/escritorio/vista_envio_contenido_a_periodistas_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaEnvioContenidoAPeriodistas}
/// Página para manejar los pasos para el envio de
/// correos electrónicos a los periodistas para dar a conocer
/// una nuevo comunicado de prensa.
/// {@endtemplate}
@RoutePage()
class PaginaEnvioContenidoAPeriodistas extends StatelessWidget {
  /// {@macro PaginaEnvioContenidoAPeriodistas}
  const PaginaEnvioContenidoAPeriodistas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocEnvioContenidoAPeriodistas(),
      child: const FullResponsiveScreen(
        mobile: VistaEnvioContenidoAPeriodistasCelular(),
        desktop: VistaEnvioContenidoAPeriodistasEscritorio(),
      ),
    );
  }
}
