import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_logo_agencia.dart';

/// {@template CuerpoDeVistaEsperaValidacionDeToken}
/// Cuerpo de la vista de espera de validacion de Token que contiene un
/// logo y un bloc consumer que puede devolver un alert dialog en caso
/// de error
/// {@endtemplate}
class CuerpoDeVistaEsperaValidacionDeToken extends StatelessWidget {
  /// {@macro CuerpoDeVistaEsperaValidacionDeToken}
  const CuerpoDeVistaEsperaValidacionDeToken({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LogoPrLabAgencia(),
        const Spacer(),
        BlocConsumer<BlocRegistro, BlocRegistroEstado>(
          listener: (context, state) {
            if (state is BlocRegistroEstadoErrorTokenInvalido) {
              showDialog<void>(
                context: context,
                builder: (context) => PRDialog.advertencia(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  context: context,
                  titulo: l10n.commonSomethingWentWrong,
                  textoDeAdvertencia: l10n.alertDialogButtonSubtitleLinkExpired,
                  textButton: l10n.commonBack,
                ),
              );
            }
          },
          builder: (BuildContext context, BlocRegistroEstado state) {
            if (state is BlocRegistroEstadoCargandoValidacionDeToken) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 12,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const Spacer(),
      ],
    );
  }
}
