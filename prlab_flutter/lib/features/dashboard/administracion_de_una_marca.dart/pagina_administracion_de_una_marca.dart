import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/bloc/bloc_administracion_de_una_marca.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/celular/vista_administracion_de_una_marca.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/escritorio/vista_administracion_de_una_marca.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaAdministracionDeUnaMarca}
/// Pagina de administracion de marcas donde el usuario puede ver sus marcas e
/// informacion de las mismas
/// {@endtemplate}
@RoutePage()
class PaginaAdministracionDeUnaMarca extends StatelessWidget {
  /// {@macro PaginaAdministracionDeUnaMarca}
  const PaginaAdministracionDeUnaMarca({
    required this.nombreMarca,
    super.key,
  });
  final String nombreMarca;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocAdministracionDeUnaMarcaBloc(),
      child: FullResponsiveScreen(
        mobile: const VistaCelularAdministracionDeUnaMarca(),
        desktop:
            VistaEscritorioAdministracionDeUnaMarca(nombreMarca: nombreMarca),
      ),
    );
  }
}
