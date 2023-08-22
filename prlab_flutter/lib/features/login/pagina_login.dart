import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/login/bloc_temporizador/bloc_temporizador.dart';
import 'package:prlab_flutter/features/login/celular/vista_login.dart';
import 'package:prlab_flutter/features/login/escritorio/vista_login.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

/// Pagina de la pantalla login donde el usuario puede iniciar sesion
@RoutePage()
class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocLogin(
            emailAuth: context.read<EmailAuthController>(),
          ),
        ),
        BlocProvider(
          create: (context) => BlocTemporizador(),
        ),
      ],
      child: const FullResponsiveScreen(
        mobile: VistaLoginCelular(),
        desktop: VistaLoginEscritorio(),
      ),
    );
  }
}
// TODO(SAM): Meter carpetas login registro y recuperar password a auth