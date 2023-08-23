import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class ListaDeArticulos extends StatelessWidget {
// TODO(mati): hacer documentacion
  const ListaDeArticulos({super.key});
  final bool tieneAutor = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.pw,
        vertical: max(30.ph, 30.sh),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 500.pw,
                child: Text(
                  // TODO(mati): hacer l10n
                  'Articles',
                  style: TextStyle(
                    color: colores.primary,
                    fontSize: 16.pf,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: tieneAutor ? 350.pw : 300.pw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100.pw,
                      height: max(30.ph, 30.sh),
                      decoration: BoxDecoration(
                        color: colores.onPrimary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child: Text(
                          // TODO(mati): hacer l10n
                          'Status',
                          style: TextStyle(
                            color: colores.primary,
                            fontSize: 16.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // TODO(mati): hacer l10n
                      'Last update',
                      style: TextStyle(
                        color: colores.primary,
                        fontSize: 16.pf,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // TODO(mati): sacar si no es mi articulo
                    ...[
                      if (tieneAutor)
                        SizedBox(
                          width: 70.pw,
                          child: Text(
                            // TODO(mati): hacer l10n
                            'Author',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                    ]
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          Container(
            width: 1000.pw,
            height: max(200.ph, 200.sh),
            padding: EdgeInsets.symmetric(vertical: max(10.ph, 10.sh)),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => PRArticulo(
                nombre: 'Flutter article',
                status: 'Feedback',
                ultimaFecha: DateTime.now(),
                tieneAutor: tieneAutor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
