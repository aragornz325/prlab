import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/kyc/bloc/bloc_kyc.dart';
import 'package:prlab_flutter/features/kyc/celular/vista_kyc_celular.dart';
import 'package:prlab_flutter/features/kyc/escritorio/vista_kyc_escritorio.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

/// {@template PaginaKyc}
/// La pagina de kyc de la aplicación.
/// Contiene las inyecciones de dependencias para
/// el manejo de estado y setea las vistas.
/// {@endtemplate}
@RoutePage()
class PaginaKyc extends StatefulWidget {
  /// {@macro PaginaKyc}
  const PaginaKyc({super.key});

  @override
  State<PaginaKyc> createState() => PaginaKycState();
}

class PaginaKycState extends State<PaginaKyc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocKyc(),
      child: const FullResponsiveScreen(
        mobile: VistaKycCelular(),
        desktop: VistaKycEscritorio(),
      ),
    );
  }
}
