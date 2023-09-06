// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/auth/kyc/bloc/bloc_kyc.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';
import 'package:prlab_flutter/widgets/dialog_calendario/calendario.dart';

/// {@template PRDialogFiltrarPorFecha}
/// Dialog de filtro por una fecha en especifica y se abre el calendario de Pr
/// lab y tiene un boton para aplicar el filtro
/// {@endtemplate}
class PRDialogSeleccionarFecha extends StatelessWidget {
  /// {@macro PRDialogFiltrarPorFecha}
  PRDialogSeleccionarFecha({super.key});

  /// Fecha a ser modificada para ser seleccionada como fecha de nacimiento del
  /// usuario
  DateTime fecha = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PRDialog.solicitudAccion(
      height: 450.ph,
      width: 200.pw,
      anchoDelBoton: 265.pw,
      alturaEntreBotonYContenido: 30.ph,
      context: context,
      titulo: l10n.pageKYCAlertDialogCalendarTitleSelectYourBirthDate,
      tituloDelBoton: l10n.commonApply,
      content: Column(
        children: [
          SizedBox(
            width: 265.pw,
            child: Calendario(
              onValueChanged: (date) {
                fecha = date.first!;
              },
              singleDatePickerValueWithDefaultValue: [
                DateTime.now(),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pop();
        context.read<BlocKyc>().add(
              BlocKycEventoRecolectarInformacionDeKyc(
                fechaDeNacimiento: fecha,
              ),
            );
      },
    );
  }
}
