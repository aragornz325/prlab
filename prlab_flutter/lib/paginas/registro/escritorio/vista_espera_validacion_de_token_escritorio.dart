import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

class VistaEsperaValidacionDeTokenEscritorio extends StatelessWidget {
  const VistaEsperaValidacionDeTokenEscritorio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Column(
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
                    textoDeAdvertencia:
                        l10n.alertDialogButtonSubtitleLinkExpired,
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
      ),
    );
  }
}
