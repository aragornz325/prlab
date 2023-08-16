import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/kyc/bloc/bloc_kyc.dart';
import 'package:prlab_flutter/paginas/kyc/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/extensions/extensions.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_textformfield.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template formulario_del_kyc}
/// Formulario que contiene todos los campos de texto
/// para completar la información basica necesaria
/// del usuario post registro.
/// {@endtemplate}
class FormularioDelKyc extends StatefulWidget {
  /// {@macro formulario_del_kyc}
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

  final nombreController = TextEditingController();

  final apellidoController = TextEditingController();

  final fechaController = TextEditingController();

  final nombreDeCompaniaController = TextEditingController();

  final localidadController = TextEditingController();

  final numeroContactoController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    nombreDeCompaniaController.dispose();
    localidadController.dispose();
    numeroContactoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    print('build');

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 90.sh),
          //TODO(Gon): Cambiar cuando esten los colores del theme
          color: const Color(0xfff7f7f7),
          width: widget.width,
          child: Column(
            children: [
              const CabeceraDelKyc(),
              PRTextFormField.soloLetras(
                controller: nombreController,
                hintText: l10n.pageKycNameHintText,
                prefixIcon: Icons.person_outline,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        nombre: nombreController.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
                controller: apellidoController,
                hintText: l10n.pageKycLastnameHintText,
                prefixIcon: Icons.person_outline,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        apellido: apellidoController.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.fecha(
                controller: fechaController,
                hintText: '00/00/0000',
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        fechaDeNacimiento: fechaController.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
                controller: nombreDeCompaniaController,
                hintText: l10n.pageKycCompanyNameHintText,
                prefixIcon: Icons.apartment_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        nombreDeCompania: nombreDeCompaniaController.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.soloLetras(
                controller: localidadController,
                hintText: l10n.pageKycCompanyLocationHintText,
                prefixIcon: Icons.location_on_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        localidadDeCompania: localidadController.text,
                      ),
                    ),
              ),
              SizedBox(height: 40.sh),
              PRTextFormField.soloNumeros(
                controller: numeroContactoController,
                hintText: l10n.pageKycContactHintText,
                prefixIcon: Icons.phone_outlined,
                context: context,
                onChanged: (_) => context.read<BlocKyc>().add(
                      BlocKycEventoRecolectarInformacionDeKyc(
                        numeroDeContacto: numeroContactoController.text,
                      ),
                    ),
              ),
              SizedBox(height: 50.sh),
              BlocBuilder<BlocKyc, BlocKycEstado>(
                builder: (context, state) {
                  return PRBoton(
                    onTap: _onTapContinuar,
                    texto: l10n.pageKycContinueTextButton,
                    habilitado: state.esFormularioCompletado,
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

  void _onTapContinuar() {
    if (!_formKey.esValido) return;

    context.read<BlocKyc>().add(BlocKycEventoInsertarInformacionDeKyc());
  }
}
