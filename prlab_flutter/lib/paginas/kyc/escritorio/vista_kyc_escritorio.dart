import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/kyc/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_seccion_logo_y_eslogan.dart';

// TODO(Andreas): Agregar docu de template.
/// {@template vista_kyc_escritorio}
/// Vista del kyc en dispositivos de tipo
/// desktop incluso en browsers.
/// {@endtemplate}
class VistaKycEscritorio extends StatelessWidget {
  /// {@macro vista_kyc_escritorio}
  const VistaKycEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FormularioDelKyc(width: 44.5.wp),
          const SeccionLogoYEslogan(),
        ],
      ),
    );
  }
}
