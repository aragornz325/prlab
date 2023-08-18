// ignore_for_file: inference_failure_on_function_invocation

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/dialog/dialog.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/vista_escritorio_crear_cuenta_admin.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/utilidades/get_error_message_crear_cuenta_admin.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PaginaCrearCuenta}
/// Pagina para crear una cuenta donde hay dos vista tanto escritorio como
/// celular
/// {@endtemplate}
@RoutePage()
class PaginaCrearCuenta extends StatelessWidget {
  /// {@macro PaginaCrearCuenta}
  @override
  const PaginaCrearCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocCrearCuentaAdmin>(
      create: (_) => BlocCrearCuentaAdmin(),
      child: BlocListener<BlocCrearCuentaAdmin, BlocCrearCuentaAdminEstado>(
        listener: (context, state) {
          /// estado si el email fue enviado correctamente sale este alertdialog
          if (state is BlocCrearCuentaAdminEstadoExitosoEmailEnviado) {
            showDialog<void>(
              context: context,
              builder: (context) => PRDialogEmailEnviado(
                email: state.email,
              ),
            );
          }

          if (state is BlocCrearCuentaAdminEstadoFallido) {
            showDialog<void>(
              context: context,
              builder: (context) => PRDialog.error(
                context: context,
                onTap: () {
                  Navigator.of(context).pop();
                },
                descripcionError: getErrorMessageCreateAccountAdmin(
                  context,
                  state.errorMessage,
                ),
              ),
            );
          }
        },
        child: const FullResponsiveScreen(
          mobile: VistaEscritorioCrearCuentaAdmin(),
          desktop: VistaEscritorioCrearCuentaAdmin(),
        ),
      ),
    );
  }
}
