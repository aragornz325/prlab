import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/auth/recuperar_password/dialog/dialog.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/dropdowns_package.dart';
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
          Future.delayed(const Duration(milliseconds: 180), () {
            context.pushRoute(
              RutaRecuperarPassword(codigoOtp: state.codigo),
            );
          });
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
          backgroundColor: Colors.black,
          body: Row(
            children: [
              Container(
                color: Colors.black,
                width: 44.5.wp,
                height: 100.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PRDropdown(
                      dropdownButtonDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: theme.background,
                      ),
                      iconsColor: theme.primary,
                      selectedItemColor: theme.primaryOpacidadDiez,
                      width: 215.pw,
                      itemhaveIcons: true,
                      itemsIconList: const [
                        Icons.menu,
                        Icons.person_outline,
                        Icons.checklist_rtl,
                        Icons.calendar_month_outlined,
                      ],
                      list: const [
                        {'id': 'all', 'label': 'All'},
                        {'id': 'author', 'label': 'Author'},
                        {'id': 'status', 'label': 'Status'},
                        {'id': 'dates', 'label': 'Dates'},
                      ],
                      initiallySelected: const [
                        {'id': 'all', 'label': 'All'},
                      ],
                      onChange: (newList) {},
                      oneMinimumSelected: true,
                    ),
                    PRDropdown(
                      dropdownButtonDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: theme.background,
                      ),
                      selectedItemColor: theme.primaryOpacidadDiez,
                      width: 215.pw,
                      hasAvatar: true,
                      list: const [
                        {'id': 'dog', 'label': 'Dog'},
                        {'id': 'cat', 'label': 'Cat'},
                        {'id': 'mouse', 'label': 'Mouse'},
                        {'id': 'rabbit', 'label': 'Rabbit'},
                      ],
                      initiallySelected: const [
                        {'id': 'mouse', 'label': 'Mouse'},
                      ],
                      onChange: (newList) {},
                      whenEmpty: 'Choose from the list',
                      // TODO(Gon): Definir que pasa con los iconos cuando seleccionas varios
                      multiSelect: true,
                      oneMinimumSelected: true,
                    ),
                    // const TextoBienvenida(),
                    // SizedBox(
                    //   width: 360.pw,
                    //   height: 40.ph,
                    //   child: PRTextFormField.email(
                    //     context: context,
                    //     controller: controllerEmail,
                    //     onChanged: (_) => _habilitarBotones(),
                    //     hintText: l10n.pageLoginPlaceholderEmail,
                    //   ),
                    // ),
                    // SizedBox(height: 10.ph),
                    // SizedBox(
                    //   width: 360.pw,
                    //   height: 40.ph,
                    //   child: PRTextFormFieldPassword(
                    //     controller: controllerPassword,
                    //     hintText: l10n.pageLoginPlaceholderPassword,
                    //     onChanged: (_) => _habilitarBotones(),
                    //   ),
                    // ),
                    // // TODO(anyone): Cuando se manejen errores de login agregar
                    // // los errores abajo de los textfields
                    // SizedBox(height: 10.ph),
                    // OlvidasteTuPassword(
                    //   cargoElMail: state.botonOlvidePasswordHabilitado,
                    //   password: controllerPassword.text,
                    //   controllerCodigo: controllerCodigo,
                    // ),
                    // SizedBox(
                    //   height: 50.ph,
                    // ),
                    // PRBoton(
                    //   estaHabilitado: state.botonLoginHabilitado,
                    //   muestraEstadoDeCarga: state.estaCargandoInicioDeSesion,
                    //   onTap: _onTapBotonIniciarSesion,
                    //   texto: l10n.pageLoginButtonText,
                    // ),
                    // SizedBox(
                    //   height: 120.ph,
                    // ),
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
