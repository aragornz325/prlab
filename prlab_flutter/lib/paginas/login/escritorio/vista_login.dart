import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/olvidaste_tu_password.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/texto_bienvenida.dart';
import 'package:prlab_flutter/paginas/recuperar_password/dialog/dialog.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// Vista de escritorio de la pantalla login donde el usuario
/// puede iniciar sesion
class VistaLoginEscritorio extends StatefulWidget {
  const VistaLoginEscritorio({super.key});

  @override
  State<VistaLoginEscritorio> createState() => _VistaLoginEscritorioState();
}

class _VistaLoginEscritorioState extends State<VistaLoginEscritorio> {
  /// Controller para el textfield de email
  final controllerEmail = TextEditingController();

  /// Controller para el textfield de password
  final controllerPassword = TextEditingController();

  /// Controller para el textfield de codigo
  final controllerCodigo = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCodigo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.colores;

    return BlocConsumer<BlocLogin, BlocLoginEstado>(
      listener: (context, state) {
        if (state.estadoErroneo || state is BlocLoginEstadoError) {
          // TODO(Gon): Implementar el manejo de errores :D
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogError(),
          );
        }
        if (state is BlocLoginEstadoExitosoAlValidarOTP) {
          Navigator.of(context).pop();
          context.router.push(
            RutaRecuperarPassword(codigoOtp: state.codigo),
          );
        }
        if (state is BlocLoginEstadoExitosoIniciarSesion) {
          context.router.replace(const RutaDashboard());
        }
      },
      builder: (context, state) {
        if (state is BlocLoginEstadoCargando &&
            state.estaIniciandoSesion == false) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          body: Row(
            children: [
              Container(
                color: theme.background,
                width: 44.5.wp,
                height: 100.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextoBienvenida(),
                    SizedBox(
                      width: 360.pw,
                      height: 40.ph,
                      child: PRTextFormField.email(
                        context: context,
                        controller: controllerEmail,
                        onChanged: (_) => _habilitarBotonLogin(),
                        hintText: l10n.pageLoginPlaceholderEmail,
                      ),
                    ),
                    SizedBox(height: 10.ph),
                    SizedBox(
                      width: 360.pw,
                      height: 40.ph,
                      child: PRTextFormFieldPassword(
                        controller: controllerPassword,
                        hintText: l10n.pageLoginPlaceholderPassword,
                        onChanged: (_) => _habilitarBotonLogin(),
                      ),
                    ),
                    // TODO(Gon): Cuando se manejen errores de login agregar
                    // los errores abajo de los textfields
                    SizedBox(height: 10.ph),
                    OlvidasteTuPassword(
                      cargoElMail: state.estaVerificadoEmail,
                      email: controllerEmail.text,
                      password: controllerPassword.text,
                      controllerCodigo: controllerCodigo,
                    ),
                    SizedBox(
                      height: 50.ph,
                    ),
                    PRBoton(
                      estaHabilitado: state.botonHabilitado,
                      muestraEstadoDeCarga: state.estaCargandoInicioDeSesion,
                      onTap: _onTapBotonIniciarSesion,
                      texto: l10n.pageLoginButtonText,
                    ),
                  ],
                ),
              ),
              const SeccionLogoYEslogan(),
            ],
          ),
        );
      },
    );
  }

  void _habilitarBotonLogin() {
    context.read<BlocLogin>().add(
          BlocLoginEventoHabilitarBotonLogin(
            email: controllerEmail.text,
            password: controllerPassword.text,
          ),
        );
  }

  void _onTapBotonIniciarSesion() {
    context.read<BlocLogin>().add(
          BlocLoginEventoIniciarSesion(
            password: controllerPassword.text,
            email: controllerEmail.text,
          ),
        );
  }
}
