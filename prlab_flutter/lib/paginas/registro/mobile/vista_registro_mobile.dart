import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/widgets/titulo_bienvenida_con_imagen.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_boton.dart';

/// Vista de mobile de la pantalla registro, la cual llega a traves del mail
///  donde el usuario puede registrarse y aceptar los terminos y condiciones.
class VistaRegistroMobile extends StatefulWidget {
  const VistaRegistroMobile({required this.email, super.key});
  final String email;
  @override
  State<VistaRegistroMobile> createState() => _VistaRegistroMobileState();
}

class _VistaRegistroMobileState extends State<VistaRegistroMobile> {
  /// Controlador del textfield que tiene el email del usuario
  TextEditingController controllerEmail = TextEditingController();

  /// Controlador del textfield que permite al usuario ingresar la password
  TextEditingController controllerPassword = TextEditingController();

  /// Controlador del textfield que permite al usuario confirmar la password
  TextEditingController controllerConfirmarPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmarPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<BlocRegistro>();
    final l10n = context.l10n;
    final tema = context.theme.colorScheme;

    return Scaffold(
      body: Row(
        children: [
          Center(
            child: Container(
              color: tema.background,
              width: 44.5.wp,
              height: 100.hp,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(child: TituloBienvenidaConImagen()),
                        SizedBox(
                          child: Center(
                            child: Text(
                              l10n.page_sign_up_subtitle,
                              style: TextStyle(
                                color: tema.shadow,
                                fontSize: 15.pf,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90.pw,
                    height: 60.ph,
                  ),
                  BlocBuilder<BlocRegistro, BlocRegistroEstado>(
                    builder: (context, state) {
                      if (state is BlocRegistroEstadoCargando) {
                        return SizedBox(
                          width: 50.pw,
                          height: 50.ph,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is BlocRegistroErrorState) {
                        return Center(
                          child: SizedBox(
                            width: 150.pw,
                            height: 150.ph,
                            child: Text(
                              bloc.traerMensajeDeError(
                                context,
                                state.errorMessage,
                              ),
                            ),
                          ),
                        );
                      }

                      if (state is BlocRegistroEstadoInicial ||
                          state is BlocRegistroEstadoExitoso) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controllerEmail,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  labelText: l10n
                                      .page_sign_up_text_field_hint_example_mail,
                                  labelStyle: TextStyle(
                                    color: tema.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.ph),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controllerPassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: l10n
                                      .page_sign_up_text_field_hint_password,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.ph),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controllerConfirmarPassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: l10n
                                      .page_sign_up_text_field_hint_confirm_password,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.ph),
                            SizedBox(
                              width: 259.pw,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: state.terminosAceptados,
                                    onChanged: (value) {
                                      _agregarEventoAceptarTerminos(
                                        context,
                                        value ?? false,
                                      );
                                    },
                                  ),
                                  Text(
                                    l10n.page_sign_up_terms_and_conditions_text,
                                    style: state.terminosAceptados
                                        ? TextStyle(
                                            color: tema.primary,
                                          )
                                        : null,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      l10n.page_sign_up_terms_and_conditions_text_link,
                                      style: TextStyle(
                                        color: tema.secondary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: tema.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.ph),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: SizedBox(
                                width: 359.pw,
                                height: 50.ph,
                                child: PRBoton(
                                  onTap: () {
                                    _agregarEventoDeEnviarDatosRegistro(
                                      context,
                                    );
                                  },
                                  texto: l10n.page_sign_up_button_sign_up,
                                  habilitado: state.terminosAceptados,
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
          const SeccionLogoBienvenida(),
        ],
      ),
    );
  }

  void _agregarEventoDeEnviarDatosRegistro(BuildContext context) {
    context.read<BlocRegistro>().add(
          BlocRegistroEventoEnviarDatosRegistro(
            email: controllerEmail.text,
            password: controllerPassword.text,
          ),
        );
  }

  void _agregarEventoAceptarTerminos(BuildContext context, bool value) {
    context.read<BlocRegistro>().add(
          BlocRegistroEventoAceptarTerminos(
            terminosAceptados: value,
          ),
        );
  }
}
