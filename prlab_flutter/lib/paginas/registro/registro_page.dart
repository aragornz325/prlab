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
    @PathParam('token-auth') required this.tokenAuth,
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
          const BlocRegistroEventoVerificarToken(
            token:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNlYmFzYW1vbnRlcm9AZ21haWwuY29tIiwiZXhwIjoxNjk0NjM3MTE4LCJpYXQiOjE2OTIwNDUxMTgsImlzcyI6InBybGFiIn0.nM0OYkdjUxBNw90IYcaZvS3MIncnkvXddyb_Rc1FmJk',
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
            return const CircularProgressIndicator();
          }
          if (state is BlocRegistroEstadoExitoso ||
              state is BlocRegistroEstadoInicial) {
            return const FullResponsiveScreen(
              mobile: RegistroVistaMobile(),
              desktop: VistaRegistroEscritorio(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
