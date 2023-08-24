import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:intl/intl.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

// TODO(mati): hacer documentacion
class PRArticulo extends StatelessWidget {
// TODO(mati): hacer documentacion
  const PRArticulo({
    required this.fecha,
    required this.nombre,
    required this.status,
    required this.tieneAutor,
    this.urlImageAutor,
    super.key,
  });
  final String nombre;
  // TODO(anyone): remplazar por el enum que se utilice
  final String status;
  final DateTime fecha;
  final bool tieneAutor;
  final String? urlImageAutor;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: tieneAutor ? 400.pw : 500.pw,
              child: Text(
                nombre,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 16.pf,
                  fontWeight: FontWeight.w400,
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
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colores.onPrimary,
                          fontSize: 15.pf,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${DateFormat.M().format(fecha)}'
                    ' ${DateFormat.MMM().format(fecha)}'
                    ' ${DateFormat.y().format(fecha)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: colores.tertiary,
                      fontSize: 16.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ...[
                    if (tieneAutor)
                      Container(
                        width: 100.pw,
                        padding: EdgeInsets.symmetric(horizontal: 3.pw),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            radius: 15.pf,
                            backgroundColor: colores.onSecondary,
                            child: CircleAvatar(
                              radius: 15.pf,
                              backgroundColor: colores.onSecondary,
                              backgroundImage: urlImageAutor != null
                                  ? NetworkImage(urlImageAutor!)
                                  : null,
                            ),
                          ),
                        ),
                      ),
                  ]
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // TODO(anyone): agregarle funcionalidad
              },
              icon: Icon(
                Icons.share_outlined,
                size: 18.pf,
                color: colores.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO(anyone): agregarle funcionalidad
              },
              icon: Icon(
                Icons.more_vert_outlined,
                size: 18.pf,
                color: colores.primary,
              ),
            ),
          ],
        ),
        Divider(color: colores.onSecondary),
      ],
    );
  }
}
