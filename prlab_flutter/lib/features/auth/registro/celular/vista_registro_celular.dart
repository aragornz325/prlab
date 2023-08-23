import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/features/auth/registro/celular/widget_espera_validacion_de_token_celular.dart';

import 'package:prlab_flutter/features/auth/registro/widgets/cuerpo_vista_registro_prlab.dart';

/// {@template VistaRegistroCelular}
/// Vista de celular de la pantalla registro, la cual llega a traves del mail
/// donde el usuario puede registrarse y aceptar los terminos y condiciones.
/// {@endtemplate}

class VistaRegistroCelular extends StatelessWidget {
  /// {@macro VistaRegistroCelular}
  const VistaRegistroCelular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocRegistro, BlocRegistroEstado>(
      builder: (context, state) {
        if (state.estaEnEstadoDeValidacion) {
          return const WidgetEsperaValidacionDeTokenCelular();
        }
        return Scaffold(
          body: CuerpoVistaRegistroPRLab(
            email: state.email,
          ),
        );
      },
    );
  }
}
