import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template BotonesCancelarYPostear}
/// Botones de `cancelar` y `postear`.
/// se despliegan los botones en caso de que el usuario quiera agregar un nuevo
/// comentario. con el focus del textfield.
/// {@endtemplate}
class BotonesCancelarYPostear extends StatelessWidget {
  /// {@macro BotonesCancelarYPostear}
  const BotonesCancelarYPostear({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(left: 30.pw),
      child: Row(
        children: [
          PRBoton.esOutlined(
            onTap: () {
              //TODO(anyone): agregarle funcionalidad
            },
            texto: l10n.commonCancel,
            estaHabilitado:
                true, // TODO(anyone): verificar que haya algo en el textfield
            width: 100.pw,
            height: max(30.ph, 30.sh),
          ),
          SizedBox(width: 20.pw),
          PRBoton(
            onTap: () {
              //TODO(anyone): agregarle funcionalidad
            },
            texto: l10n.commonPost,
            estaHabilitado:
                true, // TODO(anyone): verificar que haya algo en el textfield
            width: 100.pw,
            height: max(30.ph, 30.sh),
          ),
        ],
      ),
    );
  }
}
