import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

class PrDialogEliminar extends StatelessWidget {
  const PrDialogEliminar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.delete(
      height: max(350.ph, 350.sh),
      context: context,
      titulo: l10n.commonDelete,
      content: Column(
        children: [
          SizedBox(
            height: max(100.ph, 100.sh),
            child: Text(
              // TODO(anyone): hacer l10n
              l10n.commonDialogDescriptionDelete,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colores.secondary,
                fontSize: 15.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      tituloBotonPrimario: l10n.commonBack,
      tituloBotonSecundario: l10n.commonContinue,
      onTapBotonPrimario: () {
        // TODO (anyone): agregarle funcionalidad
        Navigator.of(context).pop();
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
      onTapBotonSecundario: () {
        // TODO (anyone): agregarle funcionalidad
        Navigator.of(context).pop();
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
    );
  }
}
