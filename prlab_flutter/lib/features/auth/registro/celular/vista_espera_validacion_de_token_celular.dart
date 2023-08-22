import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/auth/registro/widgets/cuerpo_de_vista_espera_validacion_de_token.dart';

/// {@template VistaEsperaValidacionDeTokenEscritorio}
/// Vista de espera cuando se esta validando el token del mail
/// en dispositivos de tipo celular
/// que en el caso de error mostrara un alert dialog.
/// {@endtemplate}

class VistaEsperaValidacionDeTokenCelular extends StatelessWidget {
  /// {@macro VistaEsperaValidacionDeTokenCelular}
  const VistaEsperaValidacionDeTokenCelular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CuerpoDeVistaEsperaValidacionDeToken(),
    );
  }
}
