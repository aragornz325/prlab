import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/olvidaste_tu_contrasenia.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/texto_bienvenida.dart';
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

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.esquemaDeColores;

    return Scaffold(
      body: Row(
        children: [
          BlocBuilder<BlocLogin, BlocLoginEstado>(
            builder: (context, state) {
              return Container(
                color: theme.background,
                width: 44.5.wp,
                height: 100.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextoBienvenida(),

                    // Ejemplo textfield
                    // TODO(Gon): Cambiar por los textfields factory
                    SizedBox(
                      width: 259.pw,
                      height: 20.ph,
                      child: TextFormField(
                        controller: controllerEmail,
                        onChanged: (value) {
                          _revisarSiElBotonSePuedeHabilitar(context);
                        },
                      ),
                    ),

                    //Ejemplo textfield
                    // TODO(Gon): Cambiar por los textfields factory
                    SizedBox(
                      width: 259.pw,
                      height: 20.ph,
                      child: TextFormField(
                        controller: controllerPassword,
                        onChanged: (value) {
                          _revisarSiElBotonSePuedeHabilitar(context);
                        },
                      ),
                    ),
                    if (state is BlocLoginEstadoError &&
                        state.errorMessage ==
                            LoginErrorMessages.invalidCredentials)
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.red,
                      ),
                    SizedBox(
                      height: 10.ph,
                    ),
                    const OlvidasteTuContrasenia(),
                    SizedBox(
                      height: 50.ph,
                    ),
                    PRBoton(
                      habilitado: state.botonHabilitado,
                      mostrarEstadoDeCarga: state.estaIniciandoSesion,
                      onTap: () {
                        context.read<BlocLogin>().add(
                              BlocLoginEventoIniciarSesion(
                                password: controllerPassword.text,
                                email: controllerEmail.text,
                              ),
                            );
                      },
                      texto: l10n.page_login_button_text,
                    )
                  ],
                ),
              );
            },
          ),
          const SeccionLogoBienvenida(),
        ],
      ),
    );
  }

  void _revisarSiElBotonSePuedeHabilitar(BuildContext context) {
    context.read<BlocLogin>().add(
          BlocLoginEventoHabilitarBoton(
            email: controllerEmail.text,
            password: controllerPassword.text,
          ),
        );
  }
}
