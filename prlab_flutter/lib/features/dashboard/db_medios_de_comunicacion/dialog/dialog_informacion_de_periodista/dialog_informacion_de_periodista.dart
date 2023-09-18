import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/topic_pr_card_periodista.dart';
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
  const DialogInformacionDePeriodista({
    required this.idPeriodista,
    super.key,
  });

  /// El identificador único con el que se guarda en la
  /// base de datos el periodista.
  final int idPeriodista;

  Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
          value: context.read<BlocDbMediosDeComunicacion>()
            ..add(
              BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista(
                idPeriodista,
              ),
            ),
          child: this,
        ),
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
      height: max(830.ph, 830.sh),
      width: 790.pw,
    );
  }
}
