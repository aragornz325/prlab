import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class ListaArticulos extends StatelessWidget {
// TODO(mati): hacer documentacion
  const ListaArticulos({
    super.key,
    required this.tieneAutor,
  });
  final bool tieneAutor;
  // TODO(anyone): pasarle la lista de el modelo del Articulo

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

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
                width: tieneAutor ? 400.pw : 500.pw,
                child: Text(
                  l10n.commonArticle,
                  style: TextStyle(
                    color: colores.primary,
                    fontSize: 16.pf,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: tieneAutor ? 400.pw : 300.pw,
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
                          l10n.pageContentAdministrationBarInformationStatus,
                          style: TextStyle(
                            color: colores.primary,
                            fontSize: 16.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      l10n.pageContentAdministrationBarInformationLastUpdate,
                      style: TextStyle(
                        color: colores.primary,
                        fontSize: 16.pf,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...[
                      if (tieneAutor)
                        SizedBox(
                          width: 100.pw,
                          child: Text(
                            l10n.pageContentAdministrationBarInformationAuthor,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: colores.primary,
                              fontSize: 16.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ]
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          Container(
            width: 1000.pw,
            height: max(250.ph, 250.sh),
            padding: EdgeInsets.only(top: max(10.ph, 10.sh)),
            child: ListView.builder(
              // TODO(anyone): pasarle el tamaño de la lista de los artculos
              itemCount: 10,
              itemBuilder: (context, index) => PRArticulo(
                // TODO(anyone): remplazar por cada una de las propiedades del articulo
                nombre: 'Flutter article',
                status: 'Feedback',
                fecha: DateTime.now(),
                tieneAutor: tieneAutor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
