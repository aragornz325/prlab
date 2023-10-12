import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/auth/login/escritorio/widgets/olvidaste_tu_password.dart';
import 'package:prlab_flutter/features/auth/login/escritorio/widgets/texto_bienvenida.dart';
import 'package:prlab_flutter/features/auth/recuperar_password/dialog/dialog.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
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
    final colores = context.colores;

    return BlocConsumer<BlocLogin, BlocLoginEstado>(
      listener: (context, state) {
        if (state is BlocLoginEstadoErrorAlRecuperarPassword) {
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogError(),
          );
        }

        if (state is BlocLoginEstadoErrorAlIniciarSesion) {
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogError(),
          );
        }
        if (state is BlocLoginEstadoErrorGeneral) {
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogError(),
          );
        }

        if (state is BlocLoginEstadoExitosoAlValidarOTP) {
          Navigator.pop(context);
          showDialog<void>(
            context: context,
            builder: (context) => PRDialog.exito(
              context: context,
              onTap: () {
                context.pushRoute(
                  RutaRecuperarPassword(codigoOtp: state.codigo),
                );
              },
              descripcion:
                  l10n.pageLoginInsertedCodeSuccessfullyDialogDescription,
            ),
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
                color: colores.background,
                width: 44.5.wp,
                height: 100.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextoBienvenida(),
                    SizedBox(height: max(90.ph, 90.sh)),
                    SizedBox(
                      width: 360.pw,
                      child: PRTextFormField.email(
                        context: context,
                        controller: controllerEmail,
                        onChanged: (_) => _habilitarBotones(),
                        hintText: l10n.pageLoginPlaceholderEmail,
                      ),
                    ),
                    SizedBox(height: max(40.ph, 40.sh)),
                    SizedBox(
                      width: 360.pw,
                      child: PRTextFormFieldPassword(
                        controller: controllerPassword,
                        hintText: l10n.pageLoginPlaceholderPassword,
                        onFieldSubmitted: (v) {
                          if (v.isNotEmpty && state.botonLoginHabilitado) {
                            _onTapBotonIniciarSesion();
                          }
                        },
                        onChanged: (_) => _habilitarBotones(),
                      ),
                    ),
                    // TODO(anyone): Cuando se manejen errores de login agregar
                    // los errores abajo de los textfields
                    SizedBox(height: max(10.ph, 10.sh)),
                    OlvidasteTuPassword(
                      cargoElMail: state.botonOlvidePasswordHabilitado,
                      password: controllerPassword.text,
                      controllerCodigo: controllerCodigo,
                    ),
                    SizedBox(
                      height: max(50.ph, 50.sh),
                    ),
                    PRBoton(
                      estaHabilitado: state.botonLoginHabilitado,
                      estaCargando: state.estaCargandoInicioDeSesion,
                      onTap: _onTapBotonIniciarSesion,
                      texto: l10n.pageLoginButtonText,
                    ),
                    SizedBox(
                      height: max(120.ph, 120.sh),
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

  void _habilitarBotones() {
    context.read<BlocLogin>().add(
          BlocLoginEventoHabilitarBotonLogin(
            email: controllerEmail.text,
            password: controllerPassword.text,
          ),
        );
    context.read<BlocLogin>().add(
          BlocLoginEventoHabilitarBotonOlvidePassword(
            email: controllerEmail.text,
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
