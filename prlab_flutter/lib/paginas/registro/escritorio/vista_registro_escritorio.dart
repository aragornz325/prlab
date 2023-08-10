import 'package:auto_route/auto_route.dart';
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
import 'package:prlab_flutter/utilities/widgets/pr_boton.dart';

@RoutePage()

/// Vista de escritorio de la pantalla registro, la cual llega a traves del mail
///  donde el usuario puede registrarse  y aceptar los terminos y condiciones.
class VistaRegistroEscritorio extends StatefulWidget {
  const VistaRegistroEscritorio({super.key});

  @override
  State<VistaRegistroEscritorio> createState() =>
      _VistaRegistroEscritorioState();
}

class _VistaRegistroEscritorioState extends State<VistaRegistroEscritorio> {
  /// Controlador del textfield que tiene el email del usuario
  TextEditingController controladorEmail = TextEditingController();

  /// Controlador del textfield que permite al usuario ingresar la password
  TextEditingController controladorPassword = TextEditingController();

  /// Controlador del textfield que permite al usuario confirmar la password
  TextEditingController controladorConfirmarPassword = TextEditingController();

  @override
  void dispose() {
    controladorEmail.dispose();
    controladorPassword.dispose();
    controladorConfirmarPassword.dispose();
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
                        const Center(
                          child: TituloBienvenidaConImagen(),
                        ),
                        SizedBox(
                          child: Center(
                            child: Text(
                              l10n.pageSignUpSubTitle,
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
                      if ((state is BlocRegistroEstadoInicial) ||
                          (state is BlocRegistroEstadoExitoso)) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorEmail,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  labelText:
                                      l10n.pageSignUpTextFieldHintExampleMail,
                                  labelStyle: TextStyle(
                                    color: tema.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorPassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText:
                                      l10n.pageSignUpTextFieldHintPassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorConfirmarPassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: l10n
                                      .pageSignUpTextFieldHintConfirmPassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 259.pw,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: state.terminosAceptados,
                                    onChanged: (value) {
                                      _agregarEventoAceptarTerminos(
                                        context,
                                        value,
                                      );
                                    },
                                  ),
                                  Text(
                                    l10n.pageSignUpTermsAndConditionsText,
                                    style: state.terminosAceptados!
                                        ? TextStyle(
                                            color: tema.primary,
                                          )
                                        : null,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      l10n.pageSignUpTermsAndConditionsTextLink,
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
                            SizedBox(
                              height: 40.ph,
                            ),
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
                                  texto: l10n.pageSignUpButtonSignUp,
                                  habilitado: state.terminosAceptados!,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
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
            email: controladorEmail.text,
            password: controladorPassword.text,
          ),
        );
  }

  void _agregarEventoAceptarTerminos(BuildContext context, bool? value) {
    context.read<BlocRegistro>().add(
          BlocRegistroEventoAceptarTerminos(
            terminosAceptados: value,
          ),
        );
  }
}
