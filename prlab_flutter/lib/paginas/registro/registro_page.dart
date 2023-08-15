import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/widgets/logo_prlab.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart';
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
        //    client: context.read<Client>(),
      )..add(
          BlocRegistroEventoVerificarToken(
            token: tokenAuth,
          ), // tokenAuth),
          // TODO(SAM): Descomentar a la hora de mergear
        ),
      child: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
        builder: (context, state) {
          if (state is BlocRegistroErrorState) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoPrLabAgencia(),
                  SizedBox(height: 130.ph),
                  SizedBox(height: 80.ph),
                  const Center(
                      //Alertdialog
                      ),
                ],
              ),
            );
          }
          if (state is BlocRegistroEstadoCargando) {
            return const CircularProgressIndicator(); //cambiar
          }
          if (state is BlocRegistroEstadoExitoso ||
              state is BlocRegistroEstadoInicial) {
            return FullResponsiveScreen(
              mobile: VistaRegistroMobile(
                email: state.email,
              ),
              desktop: VistaRegistroEscritorio(
                email: state.email,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
