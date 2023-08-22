import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/features/auth/registro/celular/vista_espera_validacion_de_token_celular.dart';
import 'package:prlab_flutter/features/auth/registro/celular/vista_registro_celular.dart';
import 'package:prlab_flutter/features/auth/registro/escritorio/vista_espera_validacion_de_token_escritorio.dart';
import 'package:prlab_flutter/features/auth/registro/escritorio/vista_registro_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

@RoutePage()
class PaginaRegistro extends StatelessWidget {
  const PaginaRegistro({
    @PathParam('token') required this.tokenAuth,
    super.key,
  });

  /// Token de autenticacion que recibe la pagina luego de que el usuario
  /// clickea el link de registrar cuenta que lo recibe en un email
  /// enviado previamente por un administrador.

  final String tokenAuth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRegistro(
        emailAuth: context.read<EmailAuthController>(),
      )..add(
          BlocRegistroEventoVerificarToken(token: tokenAuth),
        ),
      child: FullResponsiveScreen(
        mobile: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
          builder: (context, state) {
            if (state.estaEnEstadoDeValidacion) {
              return const VistaEsperaValidacionDeTokenCelular();
            }

            return VistaRegistroCelular(
              email: state.email,
            );
          },
        ),
        desktop: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
          builder: (context, state) {
            if (state.estaEnEstadoDeValidacion) {
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
