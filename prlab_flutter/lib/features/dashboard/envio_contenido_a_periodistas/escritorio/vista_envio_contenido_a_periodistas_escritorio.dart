import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

/// {@template VistaEnvioContenidoAPeriodistasEscritorio}
/// Vista para escritorio para manejar los
/// pasos para el envio de correos electrónicos a los
/// periodistas para dar a conocer una nuevo comunicado de prensa.
/// {@endtemplate}
class VistaEnvioContenidoAPeriodistasEscritorio extends StatelessWidget {
  /// {@macro VistaEnvioContenidoAPeriodistasEscritorio}
  const VistaEnvioContenidoAPeriodistasEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        RutaSelectorDeDestinatarios(),
        RutaEditorCorreoElectronico(),
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, _) => child,
    );
  }
}
