import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/dialog/pr_dialog_email_enviado.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/utilidades/get_error_message_crear_cuenta_admin.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template VistaEscritorioCrearCuentaAdmin}
/// Vista de escritorio para crear una cuenta a un admin
/// {@endtemplate}
class VistaEscritorioCrearCuentaAdmin extends StatefulWidget {
  /// {@macro VistaEscritorioCrearCuentaAdmin}
  @override
  const VistaEscritorioCrearCuentaAdmin({super.key});

  @override
  State<VistaEscritorioCrearCuentaAdmin> createState() =>
      _VistaEscritorioCrearCuentaAdminState();
}

class _VistaEscritorioCrearCuentaAdminState
    extends State<VistaEscritorioCrearCuentaAdmin> {
  /// controller de la vista de escritorio
  final controllerEmail = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return BlocListener<BlocCrearCuentaAdmin, BlocCrearCuentaAdminEstado>(
      listener: (context, state) {
        /// estado si el email fue enviado correctamente sale este alertdialog
        if (state is BlocCrearCuentaAdminEstadoExitosoEmailEnviado) {
          final email = controllerEmail.text;

          showDialog<void>(
            context: context,
            builder: (context) => PRDialogEmailEnviado(
              email: email,
            ),
          );
          controllerEmail.clear();
        }

        if (state is BlocCrearCuentaAdminEstadoFallido) {
          showDialog<void>(
            context: context,
            builder: (context) => PRDialog.error(
              context: context,
              onTap: () {
                Navigator.of(context).pop();
              },
              contenido: Text(
                getErrorMessageCreateAccountAdmin(
                  context,
                  state.errorMessage,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoPrLabAgencia(),
              SizedBox(height: max(100.ph, 100.sh)),
              PrLabEmailYBotonEnviar(controller: controllerEmail),
              SizedBox(height: max(100.ph, 100.sh)),
              Center(
                child: PRBoton.esOutlined(
                  width: 196.pw,
                  onTap: () => context.router.pop(),
                  texto: l10n.commonBack,
                  estaHabilitado: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
