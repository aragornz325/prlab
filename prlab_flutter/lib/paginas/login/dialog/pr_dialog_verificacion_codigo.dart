import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
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
        '${l10n.alert_dialog_sub_title_verification_code_send}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(email)}***@'
        '${obtenerTextoDespuesSimbolo(email)}';
    final state = context.watch<BlocLogin>().state;
    return PRDialog.solicitudAccion(
      height: 270.ph,
      context: context,
      estaHabilitado: state.tamanioCodigo == 8,
      onTap: () {
        context.read<BlocLogin>().add(
              BlocLoginEventoEnviarCodigoAlBack(
                codigo: controllerCodigo.text,
              ),
            );
      },
      titulo: l10n.alert_dialog_title_recover_password,
      content: Column(
        children: [
          // TODO: cambiar para cuando este en los textfield de factory
          PrLabTextfield(
            controller: controllerCodigo,
            solicitoNuevoCodigo: state is BlocLoginEstadoCronometroCorriendo,
            email: email,
            segundosFaltantes: state.duracionTimer,
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
