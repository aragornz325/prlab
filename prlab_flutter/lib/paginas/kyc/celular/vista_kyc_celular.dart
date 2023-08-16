import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/kyc/widgets/widgets.dart';

class VistaKycCelular extends StatelessWidget {
  const VistaKycCelular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioDelKyc(width: 100.wp),
    );
  }
}
