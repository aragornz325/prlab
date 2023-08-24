import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

class PanelPRLab extends StatelessWidget {
  const PanelPRLab({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Column(
      children: [
        Container(
          width: 1040.pw,
          height: 100.ph,
          color: colores.primary.withOpacity(.5),
        ),
        SizedBox(height: 40.pw),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.beenhere_outlined,
                  size: 40.pf,
                  color: colores.primary,
                ),
                SizedBox(width: 5.pw),
                Text(
                  'Your brands',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.pf,
                    color: colores.tertiary,
                  ),
                ),
              ],
            ),
            Text(
              'View all the articles of this brand.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.pf,
                color: colores.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.pw),
      ],
    );
  }
}
