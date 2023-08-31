import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/bloc/bloc_administracion_de_una_marca.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/celular/vista_administracion_de_una_marca.dart';
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/escritorio/vista_administracion_de_una_marca.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

//! TODO(anyone): DEFINIR SI [AdministracionDeUnaMarca] ES EL NOMBRE CORRECTO
/// {@template PaginaAdministracionDeUnaMarca}
/// Pagina de administracion de una marca donde el usuario puede los articulos
/// de sus marcas e informacion de los mismas
/// {@endtemplate}
@RoutePage()
class PaginaAdministracionDeUnaMarca extends StatelessWidget {
  /// {@macro PaginaAdministracionDeUnaMarca}
  const PaginaAdministracionDeUnaMarca({
    @PathParam('nombreMarca') required this.nombreMarca,
    super.key,
  });

  /// Nombre de la marca a mostrar en el encabezado
  final String nombreMarca;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocAdministracionDeUnaMarca(),
      child: FullResponsiveScreen(
        mobile: const VistaCelularAdministracionDeUnaMarca(),
        desktop:
            VistaEscritorioAdministracionDeUnaMarca(nombreMarca: nombreMarca),
      ),
    );
  }
}
