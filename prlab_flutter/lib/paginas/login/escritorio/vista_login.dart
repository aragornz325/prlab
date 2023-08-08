import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/olvidaste_tu_contrasenia.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/seccion_logo_bienvenida.dart';
import 'package:prlab_flutter/paginas/login/escritorio/widgets/texto_bienvenida.dart';

class ViewLoginDesktop extends StatelessWidget {
  const ViewLoginDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color(0xfff7f7f7),
            width: 44.5.wp,
            height: 100.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextoBienvenida(),

                //Ejemplo textfield
                //TODO(Gon): Cambiar por los textfields factory
                SizedBox(
                  width: 259.pw,
                  child: const TextField(),
                ),

                //Ejemplo textfield
                //TODO(Gon): Cambiar por los textfields factory
                SizedBox(
                  width: 259.pw,
                  child: const TextField(),
                ),
                const OlvidasteTuContrasenia(),

                //Ejemplo Boton Login
                //TODO(Gon): Cambiar por los botones factory
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: SizedBox(
                    width: 359.pw,
                    height: 50.ph,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffA12B46).withOpacity(
                          .3,
                        ),
                      ),
                      child: const Text('Log in'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SeccionLogoBienvenida(),
        ],
      ),
    );
  }
}
