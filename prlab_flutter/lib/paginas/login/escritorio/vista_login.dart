import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/olvidaste_tu_contrasenia.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/texto_bienvenida.dart';
import 'package:prlab_flutter/paginas/login/utilidades/get_error_message.dart';
import 'package:prlab_flutter/utilidades/funciones/validators.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.colores;

    return BlocBuilder<BlocLogin, BlocLoginEstado>(
      builder: (context, state) {
        if (state is BlocLoginEstadoCargando &&
            state.estaIniciandoSesion == false) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is BlocLoginEstadoError) {
          // TODO(Gon): Todavia no hay diseño para el error handling
          print(getErrorMessage(context, state.mensajeDeError));
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
                        onChanged: (p0) {
                          _habilitarBotonLogin();
                          setState(() {});
                        },
                        hintText: l10n.pageLoginPlaceholderEmail,
                      ),
                    ),

                    SizedBox(
                      height: 10.ph,
                    ),
                    // TODO(Gon): Cuando se manejen errores de login agregar
                    // los errores
                    // abajo de los textfields
                    SizedBox(
                      width: 360.pw,
                      height: 40.ph,
                      child: PRTextFormFieldPassword(
                        controller: controllerPassword,
                        hintText: l10n.pageLoginPlaceholderPassword,
                        onChanged: (_) => _habilitarBotonLogin(),
                      ),
                    ),

                    if (state is BlocLoginEstadoError &&
                        state.mensajeDeError ==
                            MensajesDeErrorDelLogin.invalidCredentials)
                      // TODO(Gon): mostrar los popups correspondientes
                      // a los errores
                      Container(
                        width: 20,
                        height: 20,
                        // TODO(anyone): Cambiar colors a los del theme
                        color: Colors.red,
                      ),
                    SizedBox(
                      height: 10.ph,
                    ),
                    OlvidasteTuContrasenia(
                      cargoElMail: Validators.emailRegExp.hasMatch(
                        controllerEmail.text,
                      ),
                      email: controllerEmail.text,
                      password: controllerPassword.text,
                      controllerCodigo: controllerCodigo,
                    ),
                    SizedBox(
                      height: 50.ph,
                    ),
                    PRBoton(
                      habilitado: state.botonHabilitado,
                      mostrarEstadoDeCarga: state.estaCargandoInicioDeSesion,
                      onTap: _onTapBotonIniciarSesion,
                      texto: l10n.pageLoginButtonText,
                    )
                  ],
                ),
              ),
              const SeccionLogoBienvenida(),
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
