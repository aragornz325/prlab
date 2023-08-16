import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/kyc/widgets/widgets.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';

class VistaKycEscritorio extends StatelessWidget {
  const VistaKycEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FormularioDelKyc(width: 44.5.wp),
          const SeccionLogoBienvenida(),
        ],
      ),
    );
  }
}
