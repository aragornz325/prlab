import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';

class TarjetasDeCarga extends StatelessWidget {
  const TarjetasDeCarga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1010.pw,
      height: 300.ph,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TarjetaCargando(),
              SizedBox(
                width: 50.pw,
              ),
              const TarjetaCargando(),
              SizedBox(
                width: 50.pw,
              ),
              const TarjetaCargando(),
            ],
          ),
          // TODO(Gon): Botones para cambiar entre tarjetas
          // Positioned(
          //   left: -10.pw,
          //   child: Container(
          //     width: 50.sw,
          //     height: 50.sh,
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(100),
          //       ),
          //       color: colores.primary,
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0, 2),
          //           blurRadius: 4,
          //           spreadRadius: 2,
          //         ),
          //       ],
          //     ),
          //     child: Center(
          //       child: Transform.rotate(
          //         angle: pi / 2,
          //         child: Icon(
          //           Icons.arrow_drop_down_rounded,
          //           size: 25.pf,
          //           color: colores.primary,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   right: 10.pw,
          //   child: Container(
          //     width: 50.sw,
          //     height: 50.sh,
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(100),
          //       ),
          //       color: colores.background,
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0, 2),
          //           blurRadius: 4,
          //           spreadRadius: 2,
          //         ),
          //       ],
          //     ),
          //     child: Center(
          //       child: Transform.rotate(
          //         angle: 3 * pi / 2,
          //         child: Icon(
          //           Icons.arrow_drop_down_rounded,
          //           size: 25.pf,
          //           color: colores.primary,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
