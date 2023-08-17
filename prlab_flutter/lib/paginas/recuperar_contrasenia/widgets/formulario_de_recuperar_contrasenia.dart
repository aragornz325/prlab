import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/bloc/bloc_recuperar_contrasenia.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/extensions/extensions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template formulario_de_recuperar_contrasenia}
/// Formulario que contiene todos los campos de texto
/// para completar la información basica necesaria
/// para cambiar la contraseña de un usuario.
/// {@endtemplate}
class FormularioDeRecuperarContrasenia extends StatefulWidget {
  /// {@macro formulario_de_recuperar_contrasenia}
  const FormularioDeRecuperarContrasenia({
    required this.width,
    super.key,
  });

  /// Ancho del formulario.
  final double width;

  @override
  State<FormularioDeRecuperarContrasenia> createState() =>
      _FormularioDeRecuperarContraseniaState();
}

class _FormularioDeRecuperarContraseniaState
    extends State<FormularioDeRecuperarContrasenia> {
  final _formKey = GlobalKey<FormState>();

  final contraseniaController = TextEditingController();

  final contraseniaRepetidaController = TextEditingController();

  @override
  void dispose() {
    contraseniaController.dispose();
    contraseniaRepetidaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return BlocListener<BlocRecuperarContrasenia,
        BlocRecuperarContraseniaEstado>(
      listener: (context, state) {
        if (state.esEstadoExitoso) {
          // TODO(Andreas): Completar esto cuando esten los popups
        }

        if (state.esEstadoFallido) {
          // TODO(Andreas): Completar esto cuando esten los popups
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 170.sh),
            color: colores.background,
            width: widget.width,
            child: Column(
              children: [
                const EncabezadoDeRecuperarContrasenia(),
                PRTextFormFieldPassword(
                  controller: contraseniaController,
                  hintText: l10n.pageRecoverPasswordNewPasswordHintText,
                  onChanged: (_) =>
                      context.read<BlocRecuperarContrasenia>().add(
                            BlocRecuperarContraseniaEventoRecolectarData(
                              contrasenia: contraseniaController.text,
                            ),
                          ),
                ),
                SizedBox(height: 40.sh),
                PRTextFormFieldPassword(
                  controller: contraseniaRepetidaController,
                  hintText: l10n.pageRecoverPasswordRepeatPasswordHintText,
                  validator: _validarContraseniaRepetida,
                  onChanged: (_) =>
                      context.read<BlocRecuperarContrasenia>().add(
                            BlocRecuperarContraseniaEventoRecolectarData(
                              contraseniaRepetida:
                                  contraseniaRepetidaController.text,
                            ),
                          ),
                ),
                SizedBox(height: 50.sh),
                BlocBuilder<BlocRecuperarContrasenia,
                    BlocRecuperarContraseniaEstado>(
                  builder: (context, state) {
                    return PRBoton(
                      onTap: _onTapContinuar,
                      texto: l10n.commonContinue,
                      habilitado: state.estanCompletasLasContrasenias,
                    );
                  },
                ),
                SizedBox(height: 80.sh),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validarContraseniaRepetida(String? value) {
    if (contraseniaController.text != value) {
      return context.l10n.commonPasswordDoNotMatch;
    }

    return null;
  }

  void _onTapContinuar() {
    if (!_formKey.esValido) return;

    context
        .read<BlocRecuperarContrasenia>()
        .add(BlocRecuperarContraseniaEventoRecolectarData());
  }
}
