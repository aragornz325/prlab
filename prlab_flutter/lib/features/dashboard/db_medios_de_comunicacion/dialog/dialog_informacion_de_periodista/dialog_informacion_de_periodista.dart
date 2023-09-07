import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

part 'datos_personales_del_periodista.dart';
part 'listado_de_articulos_del_periodista.dart';

/// {@template DialogInformacionDePeriodista}
/// Muestra en detalle la información del periodista que
/// se haya seleccionado en la página de db medios de comunicación
///
/// Además cuenta con una lista con buscador de los artículos
/// que haya escrito dicho periodista.
/// {@endtemplate}
class DialogInformacionDePeriodista extends StatelessWidget {
  /// {@macro DialogInformacionDePeriodista}
  const DialogInformacionDePeriodista({super.key});

  Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => this,
      );

  @override
  Widget build(BuildContext context) {
    return PRDialog(
      tipo: TipoDialog.informacion,
      contentPadding: EdgeInsets.zero,
      content: const Row(
        children: [
          DatosPersonalesDelPeriodista(),
          VerticalDivider(width: 0),
          ListadoDeArticulosDelPeriodista(),
        ],
      ),
      height: 830.ph,
      width: 790.pw,
    );
  }
}
