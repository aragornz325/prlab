import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/celular/vista_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/vista_login.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_editado.dart';

/// Pagina de la pantalla login donde el usuario puede iniciar sesion
@RoutePage()
class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocLogin(
        emailAuthControllerCustomPRLab:
            context.read<EmailAuthControllerCustomPRLab>(),
      ),
      child: BlocBuilder<BlocLogin, BlocLoginEstado>(
        builder: (context, state) {
          if (state is BlocLoginEstadoCargando) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const FullResponsiveScreen(
            mobile: VistaLoginCelular(),
            desktop: VistaLoginEscritorio(),
          );
        },
      ),
    );
  }
}
