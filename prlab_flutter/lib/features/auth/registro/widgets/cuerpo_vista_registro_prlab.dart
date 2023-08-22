import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/features/auth/registro/dialog/pr_dialog_error_registro.dart';
import 'package:prlab_flutter/features/auth/registro/widgets/form_registro.dart';
import 'package:prlab_flutter/features/auth/registro/widgets/titulo_bienvenida_con_imagen.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template CuerpoVistaRegistroPRLab}
/// Cuerpo de la vista de registro que contiene textfields y un boton para
/// registrarse
/// {@endtemplate}

class CuerpoVistaRegistroPRLab extends StatelessWidget {
  /// {@macro CuerpoVistaRegistroPRLab}
  const CuerpoVistaRegistroPRLab({
    required this.email,
    super.key,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return Center(
      child: Container(
        color: colores.background,
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
                        l10n.pageSignUpSubtitle,
                        style: TextStyle(
                          color: colores.shadow,
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
                if (state is BlocRegistroEstadoUsuarioRegistradoConExito) {
                  context.router.replace(const RutaKyc());
                }
                if (state is BlocRegistroEstadoError) {
                  _showErrorDialog(context);
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

                return FormRegistro(
                  email: email,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => const PrDialogErrorRegistro(),
    );
  }
}
