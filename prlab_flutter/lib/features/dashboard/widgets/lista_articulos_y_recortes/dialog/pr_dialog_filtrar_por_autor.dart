import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class PrDialogFiltrarPorAutor extends StatelessWidget {
// TODO(mati): hacer documentacion
  const PrDialogFiltrarPorAutor({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.informacion(
      context: context,
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
      },
      titulo: l10n.commonAlertDialogFilterByAuthor,
      botonText: l10n.commonApply,
      // TODO(anyone): cambiar esto por los dropdown de PrLab
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
          onChanged: (value) {},
        ),
      ),
    );
  }
}
