import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/widgets/titulo_bienvenida_con_imagen.dart';
import 'package:prlab_flutter/utilidades/extensions/extension_de_form.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_boton.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_textformfield.dart';

/// Vista de mobile de la pantalla registro, la cual llega a traves del mail
///  donde el usuario puede registrarse y aceptar los terminos y condiciones.
class VistaRegistroMobile extends StatefulWidget {
  const VistaRegistroMobile({required this.email, super.key});
  final String email;
  @override
  State<VistaRegistroMobile> createState() => _VistaRegistroMobileState();
}

class _VistaRegistroMobileState extends State<VistaRegistroMobile> {
  /// Key del form para validar luego.
  final _formKey = GlobalKey<FormState>();

  /// Controlador del textfield que tiene el email del usuario
  late TextEditingController controllerEmail;

  /// Controlador del textfield que permite al usuario ingresar la password
  final controllerPassword = TextEditingController();

  /// Controlador del textfield que permite al usuario confirmar la password
  final controllerConfirmarPassword = TextEditingController();

  @override
  void initState() {
    print(widget.email);
    controllerEmail = TextEditingController(
      text: widget.email,
    );
    super.initState();
  }

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
    final tema = context.colores;

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
                  BlocConsumer<BlocRegistro, BlocRegistroEstado>(
                    listener: (context, state) {
                      if (state
                          is BlocRegistroEstadoUsuarioRegistradoConExito) {
                        context.router.replace(
                          const PaginaKyc(),
                        );
                      }
                    },
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

                      if (state is BlocRegistroEstadoError) {
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

                      return Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 359.pw,
                              child: PRTextFormField.email(
                                hintText: controllerEmail.text,
                                context: context,
                                controller: controllerEmail,
                                soloLectura: true,
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 359.pw,
                              child: PRTextFormFieldPassword(
                                validator: _validarContraseniaRepetida,
                                controller: controllerPassword,
                                hintText:
                                    l10n.page_sign_up_text_field_hint_password,
                                esCreacionPassword: true,
                                onChanged: (_) {
                                  context.read<BlocRegistro>().add(
                                        BlocRegistroEventoRecolectarDatosRegistro(
                                          password: controllerPassword.text,
                                        ),
                                      );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 359.pw,
                              child: PRTextFormFieldPassword(
                                validator: _validarContraseniaRepetida,
                                controller: controllerConfirmarPassword,
                                hintText: l10n
                                    .page_sign_up_text_field_hint_confirm_password,
                                esCreacionPassword: true,
                                onChanged: (_) {
                                  context.read<BlocRegistro>().add(
                                        BlocRegistroEventoRecolectarDatosRegistro(
                                          confirmarPassword:
                                              controllerConfirmarPassword.text,
                                        ),
                                      );
                                },
                              ),
                            ),
                            SizedBox(height: 20.ph),
                            SizedBox(
                              width: 359.pw,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: state.terminosAceptados,
                                    onChanged: (value) {
                                      _agregarEventoAceptarTerminos(
                                        context,
                                        value ?? false,
                                      );
                                      context.read<BlocRegistro>().add(
                                            BlocRegistroEventoRecolectarDatosRegistro(
                                              terminosAceptados: value,
                                            ),
                                          );
                                    },
                                  ),
                                  Text(
                                    l10n.page_sign_up_terms_and_conditions_text,
                                    style: state.terminosAceptados
                                        ? TextStyle(color: tema.primary)
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
                              child:
                                  BlocBuilder<BlocRegistro, BlocRegistroEstado>(
                                builder: (context, state) {
                                  return PRBoton(
                                    // TODO(SAM): Validar que el boton
                                    //se deshabilite cuando hay algo incorrecto
                                    onTap: () {
                                      _agregarEventoDeEnviarDatosRegistro(
                                        context,
                                        state,
                                      );
                                    },
                                    texto: l10n.page_sign_up_button_sign_up,
                                    habilitado: state.estaCompletoElFormulario,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
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

  String? _validarContraseniaRepetida(String? value) {
    if (controllerPassword.text != value) {
      return context.l10n.commonPasswordDoNotMatch;
    }

    return null;
  }

  void _agregarEventoDeEnviarDatosRegistro(
    BuildContext context,
    BlocRegistroEstado state,
  ) {
    if (!_formKey.esValido ||
        !(controllerConfirmarPassword.text == controllerPassword.text) ||
        !state.terminosAceptados) return;
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
