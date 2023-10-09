import 'package:flutter/material.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// Devuelve una cadena que representa el nombre del estado
/// según el "número" dado.
String devolverNombreDelEstado({
  required int numero,
  required AppLocalizations l10n,
}) {
  return switch (numero) {
    // TODO(mati): sacar comillas cuando esten las traducciones

    1 => 'l10n.commonDraft',
    2 => 'l10n.commonFeedback',
    3 => 'l10n.commonApproved',
    4 => 'l10n.commonSchedule',
    5 => 'l10n.commonPublished',
    _ => '',
  };
}

/// Devuelve un Color basado en el valor de numero y
/// los colores del tema definidos en BuildContext.
Color devolverColorDependiendoDelEstado({
  required int numero,
  required BuildContext context,
}) {
  final colores = context.colores;

  return switch (numero) {
    1 => colores.secondary,
    2 => colores.onTertiary,
    3 => colores.primaryContainer,
    4 => colores.onSurfaceVariant,
    5 => colores.onTertiaryContainer,
    _ => colores.secondary,
  };
}
