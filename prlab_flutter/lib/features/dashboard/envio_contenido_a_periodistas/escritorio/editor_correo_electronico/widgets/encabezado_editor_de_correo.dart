import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

class EncabezadoEditorDeCorreo extends StatelessWidget {
  const EncabezadoEditorDeCorreo({
    required this.onSiguiente,
    required this.onVolver,
    super.key,
  });

  /// Se ejecuta cuando se presiona el boton que dice
  /// `siguiente`.
  final void Function() onSiguiente;

  /// Se ejecuta cuando se presiona el boton que dice
  /// `volver`.
  final void Function() onVolver;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      children: [
        EncabezadoDeSeccion(
          icono: Icons.beenhere_outlined,
          titulo: l10n.pageSendDeliverablesWriteEmailLabel,
          descripcion: l10n.pageSendDeliverablesStepsLabel(2, 3),
        ),
        const Spacer(),
        PRBoton.esOutlined(
          onTap: onVolver,
          texto: l10n.commonBack,
          estaHabilitado: true,
          width: 125.sw,
          height: 30.sh,
        ),
        SizedBox(width: 20.pw),
        PRBoton(
          onTap: onSiguiente,
          texto: l10n.commonNext,
          estaHabilitado: true,
          width: 125.sw,
          height: 30.sh,
        ),
        SizedBox(width: 30.pw),
      ],
    );
  }
}
