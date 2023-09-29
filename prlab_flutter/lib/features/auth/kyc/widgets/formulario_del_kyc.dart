import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/kyc/bloc/bloc_kyc.dart';
import 'package:prlab_flutter/features/auth/kyc/dialog/dialog.dart';
import 'package:prlab_flutter/features/auth/kyc/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template FormularioDelKyc}
/// Formulario que contiene todos los campos de texto
/// para completar la información basica necesaria
/// del usuario post registro.
/// {@endtemplate}
class FormularioDelKyc extends StatefulWidget {
  /// {@macro FormularioDelKyc}
  const FormularioDelKyc({
    required this.width,
    super.key,
  });

  /// Ancho de el formulario.
  final double width;

  @override
  State<FormularioDelKyc> createState() => _FormularioDelKycState();
}

class _FormularioDelKycState extends State<FormularioDelKyc> {
  final _formKey = GlobalKey<FormState>();

  final controllerNombre = TextEditingController();

  final controllerApellido = TextEditingController();

  final controllerFechaDeNacimiento = TextEditingController();

  final controllerNombreDeCompania = TextEditingController();

  final controllerLocalidad = TextEditingController();

  final controllerNumeroContacto = TextEditingController();

  @override
  void dispose() {
    controllerNombre.dispose();
    controllerApellido.dispose();
    controllerFechaDeNacimiento.dispose();
    controllerNombreDeCompania.dispose();
    controllerLocalidad.dispose();
    controllerNumeroContacto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 90.ph),
          color: colores.background,
          width: widget.width,
          child: Column(
            children: [
              const EncabezadoDelKyc(),
              PRTextFormField.soloLetras(
                width: 359.pw,
                controller: controllerNombre,
                hintText: l10n.pageKycNameHintText,
                prefixIcon: Icons.person_outline,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        nombre: controllerNombre.text,
                      ),
                    ),
              ),
              SizedBox(height: max(40.ph, 40.sh)),
              PRTextFormField.soloLetras(
                width: 359.pw,
                controller: controllerApellido,
                hintText: l10n.pageKycLastNameHintText,
                prefixIcon: Icons.person_outline,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        apellido: controllerApellido.text,
                      ),
                    ),
              ),
              SizedBox(height: max(40.ph, 40.sh)),
              BlocBuilder<BlocKyc, BlocKycEstado>(
                builder: (context, state) {
                  return PRTextFormField.fecha(
                    width: 359.pw,
                    controller: controllerFechaDeNacimiento,
                    hintText: state.fechaDeNacimiento != null
                        ? state.etiquetaFechaNacimiento
                        : l10n.commonDateHintText,
                    context: context,
                    onTap: () => _showDialogCalendario(context),
                    esSoloLectura: true,
                  );
                },
              ),
              SizedBox(height: max(40.ph, 40.sh)),
              PRTextFormField.soloLetras(
                width: 359.pw,
                controller: controllerNombreDeCompania,
                hintText: l10n.pageKycCompanyNameHintText,
                prefixIcon: Icons.apartment_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        nombreDeCompania: controllerNombreDeCompania.text,
                      ),
                    ),
              ),
              SizedBox(height: max(40.ph, 40.sh)),
              PRTextFormField.soloLetras(
                width: 359.pw,
                controller: controllerLocalidad,
                hintText: l10n.pageKycCompanyLocationHintText,
                prefixIcon: Icons.location_on_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        localidadDeCompania: controllerLocalidad.text,
                      ),
                    ),
              ),
              SizedBox(height: max(40.ph, 40.sh)),
              PRTextFormField.soloNumeros(
                width: 359.pw,
                controller: controllerNumeroContacto,
                hintText: l10n.pageKycContactHintText,
                prefixIcon: Icons.phone_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        numeroDeContacto: controllerNumeroContacto.text,
                      ),
                    ),
              ),
              SizedBox(height: max(50.ph, 50.sh)),
              BlocConsumer<BlocKyc, BlocKycEstado>(
                listener: (context, state) {
                  if (state is BlocKycEstadoExitoso) {
                    _showSuccessDialog(context);
                  }
                  if (state.fechaDeNacimiento != null) {
                    controllerFechaDeNacimiento.text =
                        state.etiquetaFechaNacimiento;
                  }
                },
                builder: (context, state) {
                  return PRBoton(
                    onTap: _onTapContinuar,
                    texto: l10n.commonContinue,
                    estaHabilitado: state.esFormularioCompletado,
                    estaCargando: state is BlocKycEstadoCargando,
                  );
                },
              ),
              SizedBox(height: max(80.ph, 80.sh)),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialogCalendario(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<BlocKyc>(),
        child: PRDialogSeleccionarFecha(),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => const PrDialogRegistroExitoso(),
    );
  }

  void _onTapContinuar() {
    if (!_formKey.esFormularioValido) return;

    context.read<BlocKyc>().add(BlocKycEventoInsertarInformacionDeKyc());
  }
}
