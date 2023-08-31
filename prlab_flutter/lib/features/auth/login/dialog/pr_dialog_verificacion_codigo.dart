import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/auth/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/auth/login/bloc_temporizador/bloc_temporizador.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogVerificacionCodigo}
/// PRDialog tiene de dialog/popup como solicitar la acción al usuario de
/// completar un campo con un codigo de 8 dígitos y validar dicho código.
/// {@endtemplate}
class PRDialogVerificacionCodigo extends StatelessWidget {
  /// {@macro PRDialogVerificacionCodigo}
  const PRDialogVerificacionCodigo({
    required this.controllerCodigo,
    required this.email,
    required this.password,
    super.key,
  });

  /// email del usuario al cual se le envio la invitación
  final String email;

  /// controller del alertdialog
  final TextEditingController controllerCodigo;

  /// password del usuario
  final String password;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    final textoAQuienFueEnviadoEmail =
        '${l10n.alertDialogSubTitleVerificationCodeSend}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(email)}***@'
        '${obtenerTextoDespuesSimbolo(email)}';

    final estadoLogin = context.watch<BlocLogin>().state;

    final estadoTemporizador = context.watch<BlocTemporizador>().state;

    return PRDialog.solicitudAccion(
      height: 300,
      context: context,
      estaHabilitado: estadoLogin.codigo.length == 8,
      onTap: () {
        context.read<BlocLogin>().add(
              const BlocLoginEventoValidarCodigo(),
            );
      },
      titulo: l10n.commonRecoverPassword,
      content: Column(
        children: [
          PRTextFormField.verificacionCodigo(
            width: 360.pw,
            controller: controllerCodigo,
            context: context,
            solicitoNuevoCodigo:
                estadoTemporizador is BlocTemporizadorEstadoCorriendo,
            segundosFaltantes: estadoTemporizador.duracionTimer,
            widgetDeSuffix: BlocBuilder<BlocLogin, BlocLoginEstado>(
              builder: (context, state) {
                return InkWell(
                  onTap: !estadoTemporizador.estaCorriendo
                      ? () {
                          context.read<BlocLogin>().add(
                                BlocLoginEventoEnviarCodigoAlUsuario(
                                  email: state.email,
                                ),
                              );
                          context
                              .read<BlocTemporizador>()
                              .add(BlocTemporizadorEventoEmpezar());
                        }
                      : null,
                  child: Text(
                    !estadoTemporizador.estaCorriendo
                        ? l10n.alertDialogTextfieldSuffixGetCode
                        : l10n.alertDialogTextfieldSuffixCodeSend,
                    style: TextStyle(
                      decoration: TextDecoration.combine([
                        if (!estadoTemporizador.estaCorriendo)
                          TextDecoration.underline
                        else
                          TextDecoration.none,
                      ]),
                      color: !estadoTemporizador.estaCorriendo
                          ? colores.primary
                          : colores.secondary,
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
            onChanged: (value) {
              if (value.isNotEmpty || value != '') {
                context.read<BlocLogin>().add(
                      BlocLoginEventoActualizarCodigo(codigo: value),
                    );
              }
            },
          ),
          Text(
            textoAQuienFueEnviadoEmail,
            style: TextStyle(
              fontSize: 12.pf,
              fontWeight: FontWeight.w400,
              color: colores.tertiary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
