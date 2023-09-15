import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/model_periodista.dart';

class PRCardeArticuloReciente extends StatelessWidget {
  const PRCardeArticuloReciente({
    required this.periodista,
    required this.titulo,
    required this.onTap,
    super.key,
  });

  // TODO(anyone): Reemplazar por modelo del back Modelo de periodista traido
  // del backend.
  final Periodista periodista;

  /// Titulo del articulo
  final String titulo;

  /// OnTap del icono de opciones
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 300.pw,
      height: max(233.ph, 233.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.sw)),
        color: colores.surfaceTint,
      ),
      child: Column(
        children: [
          SizedBox(
            height: max(60.ph, 60.sh),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.pw, 15.ph, 10.pw, 0.ph),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 235.pw,
                    height: max(45.ph, 45.sh),
                    child: Text(
                      titulo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        leadingDistribution: TextLeadingDistribution.even,
                        height: 0.ph,
                        color: colores.tertiary,
                        fontSize: 16.pf,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: colores.tertiary,
                      size: 25.pw,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: max(5.ph, 5.sh)),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300.pw,
                    height: max(110.ph, 110.sh),
                    child: Image.network(
                      // TODO(Manu): Reemplazar por portada del articulo cuando
                      // este definitivo
                      'https://fotografias-neox.atresmedia.com/clipping/cmsimages02/2021/05/28/1E611BEC-B0D2-4054-96A3-175FC03D5164/98.jpg?crop=1920,1080,x0,y0&width=1900&height=1069&optimize=high&format=webply',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: max(50.ph, 50.sh),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.pw),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.link_outlined,
                                color: colores.secondary,
                                size: 15.pw,
                              ),
                              SizedBox(width: 5.pw),
                              SizedBox(
                                width: 190.pw,
                                child: Text(
                                  // TODO(Manu): Reemplazar por link del
                                  // articulo o como defina guille
                                  'https://www.callofduty.com/content/',
                                  style: TextStyle(
                                    color: colores.secondary,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.schedule_outlined,
                                color: colores.secondary,
                                size: 15.pw,
                              ),
                              SizedBox(width: 5.pw),
                              Text(
                                // TODO(Manu): reemplazar por datetime
                                // cuando este hecho el modelo
                                '01 Aug 23',
                                style: TextStyle(
                                  color: colores.secondary,
                                  fontSize: 10.pf,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10.pw,
                top: 85.ph,
                child: CircleAvatar(
                  radius: 25.sw,
                  backgroundImage: const NetworkImage(
                    // TODO(Manu): Reemplazar por avatar de periodista o marca
                    'https://i0.wp.com/www.gamerfocus.co/wp-content/uploads/2021/05/ghost_call_of_duty_controversia.jpg?w=1280&ssl=1',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
