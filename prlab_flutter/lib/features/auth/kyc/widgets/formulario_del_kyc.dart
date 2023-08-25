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
          margin: EdgeInsets.only(top: 90.sh),
          color: colores.background,
          width: widget.width,
          child: Column(
            children: [
              const EncabezadoDelKyc(),
              PRTextFormField.soloLetras(
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
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
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
              SizedBox(height: 40.sh),
              PRTextFormField.fecha(
                controller: controllerFechaDeNacimiento,
                hintText: l10n.commonDateHintText,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        fechaDeNacimiento: controllerFechaDeNacimiento.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
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
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
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
              SizedBox(height: 40.sh),
              PRTextFormField.soloNumeros(
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
              SizedBox(height: 50.sh),
              BlocConsumer<BlocKyc, BlocKycEstado>(
                listener: (context, state) {
                  if (state is BlocKycEstadoExitoso) {
                    _showSuccessDialog(context);
                  }
                },
                builder: (context, state) {
                  return PRBoton(
                    onTap: _onTapContinuar,
                    texto: l10n.commonContinue,
                    estaHabilitado: state.esFormularioCompletado,
                  );
                },
              ),
              SizedBox(height: 80.sh),
            ],
          ),
        ),
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
