import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/features/auth/login/bloc_temporizador/bloc_temporizador.dart';
import 'package:prlab_flutter/features/auth/login/dialog/pr_dialog_verificacion_codigo.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template OlvidasteTuPassword}
/// Texto clickeable que se muestra un popup para solicitar un codigo
///  {@endtemplate}
class OlvidasteTuPassword extends StatefulWidget {
  /// {@macro OlvidasteTuPassword}
  const OlvidasteTuPassword({
    required this.cargoElMail,
    required this.password,
    required this.controllerCodigo,
    super.key,
  });

  /// Contraseña ingresada por el usuario
  final String password;

  /// Bool para saber si el usuario cargo un email valido
  final bool cargoElMail;

  /// Controller para el textfield del codigo
  final TextEditingController controllerCodigo;

  @override
  State<OlvidasteTuPassword> createState() => _OlvidasteTuPasswordState();
}

class _OlvidasteTuPasswordState extends State<OlvidasteTuPassword> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return BlocBuilder<BlocLogin, BlocLoginEstado>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.ph),
          child: GestureDetector(
            onTap: widget.cargoElMail
                ? () {
                    showDialog<void>(
                      context: context,
                      builder: (_) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value: context.read<BlocLogin>(),
                            ),
                            BlocProvider.value(
                              value: context.read<BlocTemporizador>(),
                            ),
                          ],
                          child: PRDialogVerificacionCodigo(
                            password: widget.password,
                            email: state.email,
                            controllerCodigo: widget.controllerCodigo,
                          ),
                        );
                      },
                    );
                  }
                : null,
            child: Text(
              l10n.pageLoginTappableText,
              style: TextStyle(
                color: widget.cargoElMail
                    ? colores.primary
                    : colores.primaryOpacidadCincuenta,
                fontSize: 12.pf,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: widget.cargoElMail
                    ? colores.primary
                    : colores.primaryOpacidadCincuenta,
              ),
            ),
          ),
        );
      },
    );
  }
}
