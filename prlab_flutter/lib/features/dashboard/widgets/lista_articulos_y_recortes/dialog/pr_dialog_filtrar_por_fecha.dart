import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';
import 'package:prlab_flutter/widgets/dialog_calendario/calendario.dart';

/// {@template PRDialogFiltrarPorFecha}
/// Dialog de filtro por una fecha en especifica y se abre el calendario de Pr
/// lab y tiene un boton para aplicar el filtro
/// {@endtemplate}
class PRDialogFiltrarPorFecha extends StatelessWidget {
  /// {@macro PRDialogFiltrarPorFecha}
  const PRDialogFiltrarPorFecha({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.solicitudAccion(
      height: 450.ph,
      width: 300,
      anchoDelBoton: 265.pw,
      alturaEntreBotonYContenido: 30.ph,
      context: context,
      titulo: l10n.commonAlertDialogFilterByDate,
      tituloDelBoton: l10n.commonApply,
      content: Column(
        children: [
          SizedBox(
            width: 265.pw,
            child: Calendario(
              onValueChanged: (date) {
                // TODO(anyone): funcion de guardar la fecha seleccionada y filtrar
                // por esa fecha.
              },
              singleDatePickerValueWithDefaultValue: [
                DateTime.now(),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        // TODO(mati): agregarle funcionalidad
        Navigator.of(context).pop();
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
    );
  }
}
