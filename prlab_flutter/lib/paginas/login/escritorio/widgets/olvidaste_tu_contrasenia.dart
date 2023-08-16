import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// Texto clickeable que se muestra en la seccion de login
class OlvidasteTuContrasenia extends StatefulWidget {
  const OlvidasteTuContrasenia({
    required this.cargoElMail,
    required this.email,
    required this.password,
    required this.controllerCodigo,
    super.key,
  });
  final String email;
  final String password;
  final bool cargoElMail;
  final TextEditingController controllerCodigo;

  @override
  State<OlvidasteTuContrasenia> createState() => _OlvidasteTuContraseniaState();
}

class _OlvidasteTuContraseniaState extends State<OlvidasteTuContrasenia> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.ph),
      child: GestureDetector(
        onTap: () {
          if (widget.cargoElMail) {
            PRDialog.recuperarContrasenia(
              password: widget.password,
              email: widget.email,
              controllerCodigo: widget.controllerCodigo,
              context: context,
            ).show(context, bloc: context.read<BlocLogin>());
          }
        },
        child: Text(
          l10n.page_login_tappable_text,
          style: TextStyle(
            color: widget.cargoElMail
                ? colores.primary
                : colores.primary.withOpacity(.5),
            fontSize: 12.pf,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: widget.cargoElMail
                ? colores.primary
                : colores.primary.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
