import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoPrLabAgencia(),
            SizedBox(height: 100.sh),
            PrLabEmailYBotonEnviar(controller: controllerEmail),
            SizedBox(height: 100.sh),
            Center(
              child: PRBoton.esOutlined(
                width: 196.pw,
                onTap: () {
                  // TODO(anyone): agregarle funcionalidad para volver atras.
                  // o popup de esta feature esta disponible en otra version
                  // todavía no esta definido que función cumple
                  // el boton hacia atrás en esta vista
                },
                texto: l10n.commonBack,
                estaHabilitado: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
