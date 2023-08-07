import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart';
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

@RoutePage()
class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullResponsiveScreen(
      // mobile: BlocProvider(
      //   create: (context) => BlocLogin(
      //     emailAuth: context.read<EmailAuthController>(),
      //     emailAuthControllerCustomGestion:
      //         context.read<EmailAuthControllerCustomGestion>(),
      //     // repoDataPersistence: context.read<DataPersistenceRepository>(),
      //     isarService: context.read<IsarService>(),
      mobile: RegistroVistaMobile(),
      desktop: VistaRegistroEscritorio(),
    );
  }
}
