import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_espera_validacion_de_token_escritorio.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart';
import 'package:prlab_flutter/paginas/registro/mobile/vista_espera_validacion_de_token_mobile.dart';
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';

@RoutePage()
class RegistroPage extends StatelessWidget {
  const RegistroPage({
    @PathParam('token') required this.tokenAuth,
    super.key,
  });

  /// Token de autenticacion que recibe la pagina luego de que el usuario
  /// clickea el link de registrar cuenta

  final String tokenAuth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRegistro(
        emailAuthControllerCustomPRLab:
            context.read<EmailAuthControllerCustomPRLab>(),
      )..add(
          BlocRegistroEventoVerificarToken(token: tokenAuth),
        ),
      child: FullResponsiveScreen(
        mobile: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
          builder: (context, state) {
            if (state is BlocRegistroEstadoCargandoValidacionDeToken ||
                state is BlocRegistroEstadoErrorTokenInvalido) {
              return const VistaEsperaValidacionDeTokenMobile();
            }

            return VistaRegistroMobile(
              email: state.email,
            );
          },
        ),
        desktop: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
          builder: (context, state) {
            if (state is BlocRegistroEstadoCargandoValidacionDeToken ||
                state is BlocRegistroEstadoErrorTokenInvalido) {
              return const VistaEsperaValidacionDeTokenEscritorio();
            }

            return VistaRegistroEscritorio(
              email: state.email,
            );
          },
        ),
      ),
    );
  }
}
