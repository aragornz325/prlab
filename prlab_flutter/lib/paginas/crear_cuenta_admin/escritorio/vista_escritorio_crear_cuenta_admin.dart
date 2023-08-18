import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template VistaEscritorioCrearCuentaAdmin}
/// Vista de escritorio para crear una cuenta a un admin
/// {@endtemplate}
class VistaEscritorioCrearCuentaAdmin extends StatefulWidget {
  /// {@macro VistaEscritorioCrearCuentaAdmin}
  @override
  const VistaEscritorioCrearCuentaAdmin({super.key});

  @override
  State<VistaEscritorioCrearCuentaAdmin> createState() =>
      _VistaEscritorioCrearCuentaAdminState();
}

class _VistaEscritorioCrearCuentaAdminState
    extends State<VistaEscritorioCrearCuentaAdmin> {
  /// controller de la vista de escritorio
  final controllerEmail = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoPrLabAgencia(),
          SizedBox(height: 130.ph),
          PrLabEmailYBotonEnviar(
            controller: controllerEmail,
          ),
          SizedBox(height: 80.ph),
          Center(
            child: PRBoton.outlined(
              width: 200.pw,
              onTap: () {
                // TODO(mati): agregarle funcionalidad para volver atras.
              },
              texto: l10n.commonBack,
              habilitado: true,
            ),
          ),
        ],
      ),
    );
  }
}
