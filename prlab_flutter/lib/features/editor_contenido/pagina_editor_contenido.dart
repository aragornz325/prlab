import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/editor_contenido/celular/vista_editor_contenido_celular.dart';
import 'package:prlab_flutter/features/editor_contenido/escritorio/vista_editor_contenido_escritorio.dart';

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
      create: (context) => BlocEditorContenido(),
      child: const FullResponsiveScreen(
        mobile: VistaRedaccionEdicionContenidoCelular(),
        desktop: VistaRedaccionEdicionContenidoEscritorio(),
      ),
    );
  }
}
