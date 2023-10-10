import 'package:flutter/material.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template StEntregablesX}
/// Extension de la clase StEntregables para sacar la informacion de dicho
/// estado.
///
/// contiene: dos get
/// uno para sacar la etiqueta dependiendo del estado
/// y otro para sacar el color dependiendo del estado
/// {@endtemplate}
extension StEntregablesX on StEntregables {
  /// obtiene el titulo dependiendo del estado
  String getEtiqueta(AppLocalizations l10n) {
    return switch (this) {
      StEntregables.draft => l10n.commonDraft,
      StEntregables.feedback => l10n.commonFeedback,
      StEntregables.approved => l10n.commonApproved,
      StEntregables.scheduled => l10n.commonSchedule,
      StEntregables.published => l10n.commonPublished,
      _ => l10n.commonDraft
    };
  }

  /// obtiene el color dependiendo del estado
  Color getColor(BuildContext context) {
    final colores = context.colores;

    return switch (this) {
      StEntregables.draft => colores.secondary,
      StEntregables.feedback => colores.onTertiary,
      StEntregables.approved => colores.primaryContainer,
      StEntregables.scheduled => colores.onSurfaceVariant,
      StEntregables.published => colores.onTertiaryContainer,
      _ => colores.secondary
    };
  }
}
