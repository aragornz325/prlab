import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prlab_flutter/features/redaccion_edicion_contenido/bloc/bloc_redaccion_edicion_contenido.dart';
import 'package:prlab_flutter/features/redaccion_edicion_contenido/celular/vista_redaccion_edicion_contenido_celular.dart';
import 'package:prlab_flutter/features/redaccion_edicion_contenido/escritorio/vista_redaccion_edicion_contenido_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaRedaccionEdicionContenido}
/// La pagina de redaccion y edicion de contenido de articulos de la aplicación.
/// Contiene las inyecciones de dependencias para
/// el manejo de estado y setea las vistas.
/// {@endtemplate}
@RoutePage()
class PaginaRedaccionEdicionContenido extends StatefulWidget {
  /// {@macro PaginaRedaccionEdicionContenido}
  const PaginaRedaccionEdicionContenido({super.key});

  @override
  State<PaginaRedaccionEdicionContenido> createState() =>
      PaginaRedaccionEdicionContenidoState();
}

class PaginaRedaccionEdicionContenidoState
    extends State<PaginaRedaccionEdicionContenido> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocRedaccionEdicionContenido(),
      child: const FullResponsiveScreen(
        mobile: VistaRedaccionEdicionContenidoCelular(),
        desktop: VistaRedaccionEdicionContenidoEscritorio(),
      ),
    );
  }
}
