import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

// TODO(Gon): Documentar
class HeaderDeSeccion extends StatelessWidget {
// TODO(Gon): Documentar
  const HeaderDeSeccion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
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
          'View all the articles of this brand, its members and their statistics.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.pf,
            color: colores.secondary,
          ),
        )
      ],
    );
  }
}
