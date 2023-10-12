import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_creacion_periodista/bloc_creacion_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/contenido_popup_de_creacion_de_periodistas.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogConfirmarSiHayData}
/// Dialog para confirmar si hay datos cargados
/// {@endtemplate}
class PRDialogConfirmarSiHayData extends StatelessWidget {
  /// {@macro PRDialogConfirmarSiHayData}
  const PRDialogConfirmarSiHayData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return BlocBuilder<BlocCreacionPeriodista, BlocCreacionPeriodistaEstado>(
      builder: (context, state) {
        return PRDialog.creacion(
          width: 905.sw,
          height: max(800.ph, 800.sh),
          titulo: l10n.pageMediaDatabaseAddJournalist,
          content: const ContenidoPopupCreacionPeriodistas(),
          context: context,
          estaCargando: state.seEstaCreando,
          onTapCancel: () {
            if (state.hayDataCargada) {
              showDialog<void>(
                context: context,
                builder: (_) => PRDialog.confirmar(
                  width: 540.sw,
                  height: 240.sh,
                  titulo: l10n.commonCancel,
                  tituloBotonPrimario: l10n.commonYes,
                  tituloBotonSecundario: l10n.commonNo,
                  content: Text(
                    l10n.pageMediaDatabaseJournalistCancelJournalistCreation,
                    style: TextStyle(
                      color: colores.secondary,
                    ),
                  ),
                  context: context,
                  onTapBotonPrimario: () => _cerrarDialog(context),
                  onTapBotonSecundario: () => Navigator.of(context).pop(),
                ),
              );
            } else {
              Navigator.of(context).pop();
            }
          },
          onTapSave: () {
            _verificarCamposRequeridos(context);
          },
        );
      },
    );
  }

  void _cerrarDialog(BuildContext context) {
    context
        .read<BlocCreacionPeriodista>()
        .add(const BlocCreacionPeriodistaEventoVaciarLista());
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  /// Verifica si el usuario completo los campos requeridos y en el caso de que
  /// no, muestra un alert dialog que le avisa y le permite volver.
  void _verificarCamposRequeridos(
    BuildContext context,
  ) {
    final colores = context.colores;
    final bloc = context.read<BlocCreacionPeriodista>().state;
    final l10n = context.l10n;
    final listaCamposRequeridos = <String>[];

    if (bloc.apellido.isNotEmpty &&
        bloc.email.isNotEmpty &&
        // TODO(SAM): Agregar luego cuando este del back
        // state.idCiudad != 0 &&
        // state.idPais != 0 &&
        bloc.telefono.isNotEmpty &&
        bloc.nombre.isNotEmpty) {
      context.read<BlocCreacionPeriodista>().add(
            const BlocCreacionPeriodistaEventoCrearPeriodista(),
          );
      Navigator.of(context).pop();
    } else {
      if (bloc.nombre.isEmpty) {
        listaCamposRequeridos.add(l10n.commonName);
      }

      if (bloc.apellido.isEmpty) {
        listaCamposRequeridos.add(l10n.commonLastName);
      }

      if (bloc.telefono.isEmpty) {
        listaCamposRequeridos.add(l10n.commonTelephone);
      }

      if (bloc.email.isEmpty) {
        listaCamposRequeridos.add(l10n.commonEmail);
      }
      final listaCampos = listaCamposRequeridos.join(', ');
      final textoAMostrar =
          '${l10n.pageMediaDatabaseAddJournalistErrorAlertDialog}$listaCampos';
      showDialog<void>(
        context: context,
        builder: (_) => PRDialog.error(
          context: _,
          onTap: () {
            Navigator.of(context).pop();
          },
          contenido: Text(
            textoAMostrar,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.pf,
              color: colores.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
  }
}
