import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';

/// {@template TerminosCondicionesPRLab}
/// Widget custom de terminos y condiciones que tiene un checkbox, permitiendo
/// aceptarlos y un link que dirige hacia los mismos.
/// {@endtemplate}

class TerminosCondicionesPRLab extends StatefulWidget {
  /// {@macro TerminosCondicionesPRLab}
  const TerminosCondicionesPRLab({super.key});

  @override
  State<TerminosCondicionesPRLab> createState() =>
      _TerminosCondicionesPRLabState();
}

class _TerminosCondicionesPRLabState extends State<TerminosCondicionesPRLab> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return BlocBuilder<BlocRegistro, BlocRegistroEstado>(
      builder: (context, state) {
        return SizedBox(
          width: 359.pw,
          child: Row(
            children: [
              Checkbox(
                value: state.terminosAceptados,
                onChanged: (value) {
                  _agregarEventoAceptarTerminos(
                    context,
                    value ?? false,
                  );
                  context.read<BlocRegistro>().add(
                        BlocRegistroEventoRecolectarDatosRegistro(
                          terminosAceptados: value,
                        ),
                      );
                },
              ),
              Text(
                l10n.pageSignUpTermsAndConditionsText,
                style: state.terminosAceptados
                    ? TextStyle(color: colores.primary)
                    : null,
              ),
              GestureDetector(
                child: Text(
                  l10n.pageSignUpTermsAndConditionsTextLink,
                  style: TextStyle(
                    color: colores.secondary,
                    decoration: TextDecoration.underline,
                    decorationColor: colores.secondary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _agregarEventoAceptarTerminos(BuildContext context, bool value) {
    context.read<BlocRegistro>().add(
          BlocRegistroEventoAceptarTerminos(
            terminosAceptados: value,
          ),
        );
  }
}
