import 'package:flutter/material.dart';
import 'package:prlab_flutter/features/auth/registro/widgets/cuerpo_de_vista_espera_validacion_de_token.dart';

/// {@template WidgetEsperaValidacionDeTokenCelular}
/// Vista de espera cuando se esta validando el token del mail
/// en dispositivos de tipo celular
/// que en el caso de error mostrara un alert dialog.
/// {@endtemplate}

class WidgetEsperaValidacionDeTokenCelular extends StatelessWidget {
  /// {@macro WidgetEsperaValidacionDeTokenCelular}
  const WidgetEsperaValidacionDeTokenCelular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CuerpoDeVistaEsperaValidacionDeToken(),
    );
  }
}
