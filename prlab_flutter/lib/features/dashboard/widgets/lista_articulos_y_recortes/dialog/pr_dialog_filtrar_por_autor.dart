import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrDialogFiltrarPorStatus}
/// Dialog para filtrar por autor de ciertos articulos
/// {@endtemplate}
class PrDialogFiltrarPorAutor extends StatelessWidget {
  /// {@macro PrDialogFiltrarPorStatus}
  const PrDialogFiltrarPorAutor({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.informacion(
      context: context,
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
      titulo: l10n.commonAlertDialogFilterByAuthor,
      botonText: l10n.commonApply,
      // TODO(anyone): cambiar esto por los dropdown de PrLab lo estaba trabajando gon
      content: SizedBox(
        width: 300.pw,
        child: DropdownButton(
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text('hola'),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('hola'),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text('hola'),
            ),
          ],
          onChanged:
              (value) {}, 
        ),
      ),
    );
  }
}
