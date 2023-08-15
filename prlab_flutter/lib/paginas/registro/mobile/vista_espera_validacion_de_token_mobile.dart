import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/widgets/logo_prlab.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

class VistaEsperaValidacionDeTokenMobile extends StatelessWidget {
  const VistaEsperaValidacionDeTokenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoPrLabAgencia(),
          const Spacer(),
          BlocConsumer<BlocRegistro, BlocRegistroEstado>(
            listener: (context, state) {
              if (state is BlocRegistroEstadoErrorTokenInvalido) {
                PRDialog.error(
                  context: context,
                  esError: false,
                ).show<void, void>(context);
              }
            },
            builder: (BuildContext context, BlocRegistroEstado state) {
              if (state is BlocRegistroEstadoCargandoValidacionDeToken) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
