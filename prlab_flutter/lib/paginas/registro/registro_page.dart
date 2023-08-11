import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart';
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

@RoutePage()
class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

//TODO init event.add checkear token

  @override
  Widget build(BuildContext context) {
    return const FullResponsiveScreen(
      mobile: RegistroVistaMobile(),
      desktop: VistaRegistroEscritorio(),
    );
  }
}
