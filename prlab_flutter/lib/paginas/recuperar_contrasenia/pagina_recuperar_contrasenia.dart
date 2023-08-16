import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/bloc/bloc_recuperar_contrasenia.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/celular/vista_recuperar_contrasenia_celular.dart';
import 'package:prlab_flutter/paginas/recuperar_contrasenia/escritorio/vista_recuperar_contrasenia_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template pagina_recuperar_contrasenia}
/// Página recuperar contraseña en dispositivos moviles.
/// {@endtemplate}
@RoutePage()
class PaginaRecuperarContrasenia extends StatelessWidget {
  /// {@macro pagina_recuperar_contrasenia}
  const PaginaRecuperarContrasenia({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRecuperarContrasenia(),
      child: const FullResponsiveScreen(
        mobile: VistaRecuperarContraseniaCelular(),
        desktop: VistaRecuperarContraseniaEscritorio(),
      ),
    );
  }
}
