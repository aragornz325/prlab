import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/auth/recuperar_password/dialog/dialog.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';
import 'package:prlab_flutter/widgets/grafico_torta/grafico_torta.dart';

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
                child: GraficoTortaEjemplo1(
                  listaDePorcentajes: [],
                ),
                height: 300.ph,
                width: 300.pw,
                color: colores.secondary,
              ),
              SizedBox(width: 50.pw),
              Container(
                child: GraficoTortaEjemplo2(
                  listaDePorcentajes: [],
                ),
                height: 300.ph,
                width: 300.pw,
                color: colores.secondary,
              ),
              SizedBox(width: 50.pw),
              Container(
                color: colores.secondary,
                child: GraficoTortaEjemplo3(
                  listaDePorcentajes: [],
                ),
                height: 300.ph,
                width: 300.pw,
              ),
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
