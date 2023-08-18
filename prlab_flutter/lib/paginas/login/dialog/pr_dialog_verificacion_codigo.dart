import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/bloc_temporizador/bloc_temporizador.dart';
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
  final String password;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final textoAQuienFueEnviadoEmail =
        '${l10n.alertDialogSubTitleVerificationCodeSend}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(email)}***@'
        '${obtenerTextoDespuesSimbolo(email)}';

    final estadoLogin = context.watch<BlocLogin>().state;

    final estadoTemporizador = context.watch<BlocTemporizador>().state;

    return PRDialog.solicitudAccion(
      height: 270.ph,
      context: context,
      estaHabilitado: estadoLogin.longitudCodigo == 8,
      onTap: () {
        context.read<BlocLogin>().add(
              BlocLoginEventoValidarCodigo(
                codigo: controllerCodigo.text,
              ),
            );
      },
      titulo: l10n.commonRecoverPassword,
      content: Column(
        children: [
          // TODO(Mati): cambiar para cuando este en los textfield de factory
          PrLabTextfield(
            controller: controllerCodigo,
            solicitoNuevoCodigo:
                estadoTemporizador is BlocTemporizadorEstadoCorriendo,
            email: email,
            segundosFaltantes: estadoLogin.duracionTimer,
          ),
          SizedBox(height: 5.ph),
          Text(
            textoAQuienFueEnviadoEmail,
            style: TextStyle(
              fontSize: 12.pf,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
