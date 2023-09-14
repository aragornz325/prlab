import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrLabEmailYBotonEnviar}
/// Muestra el textfield a completar con el email y un boton con el cual enviar
/// al email
/// {@endtemplate}
class PrLabEmailYBotonEnviar extends StatefulWidget {
  /// {@macro PrLabEmailYBotonEnviar}
  @override
  const PrLabEmailYBotonEnviar({
    required this.controller,
    super.key,
  });

  /// controller para el email de [PrLabEmailYBotonEnviar]
  final TextEditingController controller;

  @override
  State<PrLabEmailYBotonEnviar> createState() => _PrLabEmailYBotonEnviarState();
}

class _PrLabEmailYBotonEnviarState extends State<PrLabEmailYBotonEnviar> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.pw,
          vertical: 40.ph,
        ),
        decoration: BoxDecoration(
          color: colores.background,
          borderRadius: BorderRadius.all(
            Radius.circular(15.sw),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              color: colores.negroBajaOpacidad,
            ),
          ],
        ),
        width: max(910.pw, 910.sw),
        height: max(354.ph, 354.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.pageCreateAdminClientEmail,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 30.pf,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: max(10.ph, 10.sh)),
              Text(
                l10n.pageCreateAdminLeadingPRAgency,
                style: TextStyle(
                  color: colores.secondary,
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: max(50.ph, 50.sh)),
              BlocBuilder<BlocCrearCuentaAdmin, BlocCrearCuentaAdminEstado>(
                builder: (context, state) {
                  return Center(
                    child: SizedBox(
                      height: max(40.ph, 40.sh),
                      width: 782.pw,
                      child: PRTextFormField.email(
                        controller: widget.controller,
                        onChanged: (_) => _onPasarleEmailAlBloc(),
                        context: context,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: max(50.ph, 50.sh)),
              BlocBuilder<BlocCrearCuentaAdmin, BlocCrearCuentaAdminEstado>(
                builder: (context, state) {
                  if (state is BlocCrearCuentaAdminEstadoCargando) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.sw),
                          color: colores.primary,
                        ),
                        height: max(50.ph, 50.sh),
                        width: 782.pw,
                        child: Center(
                          child: SizedBox(
                            height: max(30.ph, 30.sh),
                            width: 30.sw,
                            child: CircularProgressIndicator(
                              color: colores.background,
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return Center(
                    child: PRBoton(
                      width: 782.pw,
                      onTap: () {
                        if (!state.esEmailValido) return;

                        _onEnviarEmail(context);
                      },
                      texto: l10n.commonSend,
                      estaHabilitado: state.esEmailValido,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Funcion para enviar el email/la invitación a crear una cuenta
  void _onEnviarEmail(BuildContext context) {
    context.read<BlocCrearCuentaAdmin>().add(
          const BlocCrearCuentaAdminEventEnviarEmail(),
        );
  }

  /// Funcion para enviar el email al bloc [BlocCrearCuentaAdmin]
  void _onPasarleEmailAlBloc() {
    context.read<BlocCrearCuentaAdmin>().add(
          BlocCrearCuentaAdminEventVerificarEmail(
            email: widget.controller.text,
          ),
        );
  }
}
