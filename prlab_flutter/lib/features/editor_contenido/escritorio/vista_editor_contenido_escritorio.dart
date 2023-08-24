import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/componente_vertical_articulos.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/panel_prlab.dart';

class VistaRedaccionEdicionContenidoEscritorio extends StatelessWidget {
  const VistaRedaccionEdicionContenidoEscritorio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PanelPRLab(),
              ComponenteVerticalArticulos(),
              SizedBox(
                height: 60.ph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
