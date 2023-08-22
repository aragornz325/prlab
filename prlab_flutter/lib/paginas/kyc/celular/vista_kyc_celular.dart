import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/kyc/widgets/widgets.dart';

/// {@template VistaKycCelular}
/// Vista del kyc en dispositivos mobiles.
/// {@endtemplate}
class VistaKycCelular extends StatelessWidget {
  /// {@macro VistaKycCelular}
  const VistaKycCelular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioDelKyc(
        width: 100.wp,
      ),
    );
  }
}
