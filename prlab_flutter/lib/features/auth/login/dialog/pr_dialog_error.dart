import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogError}
/// Muestra un mensaje de error en cualquier caso
/// que ocurra un error en la recuperación de contraseña.
/// {@endtemplate}
class PRDialogError extends StatelessWidget {
  /// {@macro PRDialogError}
  const PRDialogError({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.error(
      context: context,
      // TODO(anyone):  El handleo de errores todavia no estan seteado,
      // por ende dejo esto por default hasta que se haga
      // un refactor de esto.
      descripcionError: l10n.commonSomethingWentWrong,
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
