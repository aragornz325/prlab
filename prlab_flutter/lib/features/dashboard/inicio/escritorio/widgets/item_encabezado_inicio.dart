import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:shimmer/shimmer.dart';

class ItemEncabezado extends StatelessWidget {
  const ItemEncabezado({
    required this.texto,
    required this.icono,
    this.estaCargando = false,
    super.key,
  });

  /// Texto bajo el container con icono
  final String texto;

  /// Icono dentro del container
  final IconData icono;

  /// Indica si esta cargando para mostrar un CircularProgressIndicator
  final bool estaCargando;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
      children: [
        Container(
          width: 60.sw,
          height: 60.sh,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: colores.background,
          ),
          child: Center(
            child: estaCargando
                ? SizedBox(
                    width: 20.sw,
                    height: 20.sh,
                    child: const CircularProgressIndicator(),
                  )
                : Icon(
                    icono,
                    size: 25.pf,
                    color: colores.primary,
                  ),
          ),
        ),
        SizedBox(height: 5.ph),
        if (estaCargando)
          SizedBox(
            width: 40.pw,
            height: 10.ph,
            child: Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: const Color(0xffAF2336),
              highlightColor: Colors.white.withOpacity(.7),
              child: Container(
                width: 50.pw,
                height: 10.ph,
                color: Colors.white.withOpacity(.4),
              ),
            ),
          )
        else
          Text(
            texto,
            style: TextStyle(
              fontSize: 12.pf,
              color: colores.background,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
