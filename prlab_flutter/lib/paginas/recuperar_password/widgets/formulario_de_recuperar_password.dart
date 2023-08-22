import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/recuperar_password/bloc/bloc_recuperar_password.dart';
import 'package:prlab_flutter/paginas/recuperar_password/dialog/dialog.dart';
import 'package:prlab_flutter/paginas/recuperar_password/widgets/widgets.dart';

import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template FormularioDeRecuperarPassword}
/// Formulario que contiene todos los campos de texto
/// para completar la información basica necesaria
/// para cambiar la contraseña de un usuario.
/// {@endtemplate}
class FormularioDeRecuperarPassword extends StatefulWidget {
  /// {@macro FormularioDeRecuperarPassword}
  const FormularioDeRecuperarPassword({
    required this.width,
    super.key,
  });

  /// Ancho del formulario.
  final double width;

  @override
  State<FormularioDeRecuperarPassword> createState() =>
      _FormularioDeRecuperarPasswordState();
}

class _FormularioDeRecuperarPasswordState
    extends State<FormularioDeRecuperarPassword> {
  final _formKey = GlobalKey<FormState>();

  final controllerPassword = TextEditingController();

  final controllerPasswordRepetida = TextEditingController();

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerPasswordRepetida.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return BlocListener<BlocRecuperarPassword, BlocRecuperarPasswordEstado>(
      listener: (context, state) {
        if (state.esEstadoExitoso) {
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogRecuperoDePasswordExitoso(),
          );
        }

        if (state.esEstadoFallido) {
          showDialog<void>(
            context: context,
            builder: (_) => const PRDialogError(),
          );
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
                const EncabezadoDeRecuperarPassword(),
                PRTextFormFieldPassword(
                  controller: controllerPassword,
                  hintText: l10n.pageRecoverPasswordNewPasswordHintText,
                  onChanged: (_) => context.read<BlocRecuperarPassword>().add(
                        BlocRecuperarPasswordEventoRecolectarData(
                          password: controllerPassword.text,
                        ),
                      ),
                ),
                SizedBox(height: 40.sh),
                PRTextFormFieldPassword(
                  controller: controllerPasswordRepetida,
                  hintText: l10n.pageRecoverPasswordRepeatPasswordHintText,
                  validator: _validarPasswordRepetida,
                  onChanged: (_) => context.read<BlocRecuperarPassword>().add(
                        BlocRecuperarPasswordEventoRecolectarData(
                          passwordRepetida: controllerPasswordRepetida.text,
                        ),
                      ),
                ),
                SizedBox(height: 50.sh),
                BlocBuilder<BlocRecuperarPassword, BlocRecuperarPasswordEstado>(
                  builder: (context, state) {
                    return PRBoton(
                      onTap: _onTapContinuar,
                      texto: l10n.commonContinue,
                      estaHabilitado: state.estanCompletasLasPasswords,
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

  String? _validarPasswordRepetida(String? value) {
    if (controllerPassword.text != value) {
      return context.l10n.commonPasswordDoNotMatch;
    }

    return null;
  }

  void _onTapContinuar() {
    if (!_formKey.esFormularioValido) return;

    context
        .read<BlocRecuperarPassword>()
        .add(BlocRecuperarPasswordEventoRecolectarData());
  }
}
