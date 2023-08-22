import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/features/auth/registro/escritorio/widget_espera_validacion_de_token_escritorio.dart';
import 'package:prlab_flutter/features/auth/registro/widgets/cuerpo_vista_registro_prlab.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_seccion_logo_y_eslogan.dart';

/// {@template VistaRegistroEscritorio}
/// Vista de escritorio de la pantalla registro, la cual llega a traves
/// del mail donde el usuario puede registrarse  y aceptar los terminos
/// y condiciones.
/// {@endtemplate}
class VistaRegistroEscritorio extends StatelessWidget {
  /// {@macro VistaRegistroEscritorio}
  const VistaRegistroEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocRegistro, BlocRegistroEstado>(
      builder: (context, state) {
        if (state.estaEnEstadoDeValidacion) {
          return const WidgetEsperaValidacionDeTokenEscritorio();
        }
        return Scaffold(
          body: Row(
            children: [
              CuerpoVistaRegistroPRLab(
                email: state.email,
              ),
              const SeccionLogoYEslogan(),
            ],
          ),
        );
      },
    );
  }
}
