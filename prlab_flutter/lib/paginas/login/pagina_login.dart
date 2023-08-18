import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/celular/vista_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/vista_login.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

/// Pagina de la pantalla login donde el usuario puede iniciar sesion
@RoutePage()
class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocLogin(
        emailAuth: context.read<EmailAuthController>(),
      ),
      child: const FullResponsiveScreen(
        mobile: VistaLoginCelular(),
        desktop: VistaLoginEscritorio(),
      ),
    );
  }
}
