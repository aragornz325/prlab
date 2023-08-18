import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/widgets/terminos_condiciones_prlab.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_boton.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_textformfield.dart';

/// {@template CuerpoDeVistaEsperaValidacionDeToken}
/// Cuerpo de la vista de espera de validacion de Token que contiene un
/// logo y un bloc consumer que puede devolver un alert dialog en caso
/// de error
/// {@endtemplate}
class FormRegistro extends StatefulWidget {
  /// {@macro FormRegistro}
  const FormRegistro({
    required this.email,
    super.key,
  });
  final String email;
  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  /// Key del form para validar que todos los textfields esten completos
  /// adecuadamente para poder mostrar el mensaje de error pertinente y a su vez
  /// deshabilitar el boton registrarse.
  final _formKey = GlobalKey<FormState>();

  /// Controlador del textfield que tiene el email del usuario
  late TextEditingController controllerEmail;

  /// Controlador del textfield que permite al usuario ingresar la password
  final controllerPassword = TextEditingController();

  /// Controlador del textfield que permite al usuario confirmar la password
  final controllerPasswordRepetida = TextEditingController();

  @override
  void initState() {
    controllerEmail = TextEditingController(
      text: widget.email,
    );
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPasswordRepetida.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 359.pw,
            child: PRTextFormField.email(
              hintText: controllerEmail.text,
              context: context,
              controller: controllerEmail,
              soloLectura: true,
            ),
          ),
          SizedBox(
            height: 20.ph,
          ),
          SizedBox(
            width: 359.pw,
            child: PRTextFormFieldPassword(
              validator: _validarContraseniaRepetida,
              controller: controllerPassword,
              hintText: l10n.commonPassword,
              esCreacionPassword: true,
              onChanged: (_) {
                context.read<BlocRegistro>().add(
                      BlocRegistroEventoRecolectarDatosRegistro(
                        password: controllerPassword.text,
                      ),
                    );
              },
            ),
          ),
          SizedBox(
            height: 20.ph,
          ),
          SizedBox(
            width: 359.pw,
            child: PRTextFormFieldPassword(
              validator: _validarContraseniaRepetida,
              controller: controllerPasswordRepetida,
              hintText: l10n.pageSignUpTextFieldHintConfirmPassword,
              esCreacionPassword: true,
              onChanged: (_) {
                context.read<BlocRegistro>().add(
                      BlocRegistroEventoRecolectarDatosRegistro(
                        confirmarPassword: controllerPasswordRepetida.text,
                      ),
                    );
              },
            ),
          ),
          SizedBox(height: 20.ph),
          const TerminosCondicionesPRLab(),
          SizedBox(height: 40.ph),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            child: BlocBuilder<BlocRegistro, BlocRegistroEstado>(
              builder: (context, state) {
                return PRBoton(
                  onTap: () => _agregarEventoDeEnviarDatosRegistro(
                    state.terminosAceptados,
                  ),
                  texto: l10n.pageSignUpButtonSignUp,
                  estaHabilitado: state.estaCompletoElFormulario,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String? _validarContraseniaRepetida(String? value) {
    if (controllerPassword.text != value) {
      return context.l10n.commonPasswordDoNotMatch;
    }

    return null;
  }

  void _agregarEventoDeEnviarDatosRegistro(
    bool terminosAceptados,
  ) {
    if (!_formKey.esFormularioValido ||
        !(controllerPasswordRepetida.text == controllerPassword.text) ||
        !terminosAceptados) return;
    context.read<BlocRegistro>().add(
          BlocRegistroEventoEnviarDatosRegistro(
            email: controllerEmail.text,
            password: controllerPassword.text,
          ),
        );
  }
}
