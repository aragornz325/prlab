import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/celular/vista_celular_crear_cuenta_admin.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/escritorio/vista_escritorio_crear_cuenta_admin.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaCrearCuenta}
/// Pagina para crear una cuenta donde hay dos vista tanto escritorio como
/// celular
/// {@endtemplate}
@RoutePage()
class PaginaCrearCuenta extends StatelessWidget {
  /// {@macro PaginaCrearCuenta}
  @override
  const PaginaCrearCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocCrearCuentaAdmin>(
      create: (_) => BlocCrearCuentaAdmin(),
      child: BlocBuilder<BlocCrearCuentaAdmin, BlocCrearCuentaAdminState>(
        builder: (context, state) {
          if (state is BlocCrearCuentaAdminStateLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is BlocCrearCuentaAdminStateSuccess) {
            return const FullResponsiveScreen(
              mobile: VistaEscritorioCrearCuentaAdmin(),
              desktop: VistaEscritorioCrearCuentaAdmin(),
            );
          }
          return const FullResponsiveScreen(
            mobile: VistaEscritorioCrearCuentaAdmin(),
            desktop: VistaEscritorioCrearCuentaAdmin(),
          );
        },
      ),
    );
  }
}
