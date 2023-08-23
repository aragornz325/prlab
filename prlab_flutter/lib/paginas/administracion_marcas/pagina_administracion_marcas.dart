import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/celular/vista_administracion_marcas.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/vista_administracion_marcas.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

// TODO(Gon): Documentar
@RoutePage()
class PaginaAdministracionMarcas extends StatelessWidget {
// TODO(Gon): Documentar
  const PaginaAdministracionMarcas({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocAdministracionMarcas(),
        ),
      ],
      child: const FullResponsiveScreen(
        mobile: VistaCelularAdministracionMarcas(),
        desktop: VistaEscritorioAdministracionMarcas(),
      ),
    );
  }
}
