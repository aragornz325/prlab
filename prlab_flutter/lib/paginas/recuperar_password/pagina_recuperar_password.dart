import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/recuperar_password/bloc/bloc_recuperar_password.dart';
import 'package:prlab_flutter/paginas/recuperar_password/celular/vista_recuperar_password_celular.dart';
import 'package:prlab_flutter/paginas/recuperar_password/escritorio/vista_recuperar_password_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaRecuperarPassword}
/// La pagina de recuperar contraseña de la aplicación/web.
/// Contiene las inyecciones de dependencias para
/// el manejo de estado y setea las vistas.
/// {@endtemplate}
@RoutePage()
class PaginaRecuperarPassword extends StatelessWidget {
  /// {@macro PaginaRecuperarPassword}
  const PaginaRecuperarPassword({
    required this.codigoOtp,
    super.key,
  });

  final String codigoOtp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRecuperarPassword(codigoOTP: codigoOtp),
      child: const FullResponsiveScreen(
        mobile: VistaRecuperarPasswordCelular(),
        desktop: VistaRecuperarPasswordEscritorio(),
      ),
    );
  }
}
