import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart';
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

@RoutePage()
class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRegistro(
        emailAuthControllerCustomPRLab: EmailAuthControllerCustomPRLab(
          client.modules.auth,
        ),
      ),
      child: const FullResponsiveScreen(
        mobile: RegistroVistaMobile(),
        desktop: VistaRegistroEscritorio(),
      ),
    );
  }
}
