import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/constants/constantes_de_imagenes.dart';

class TextoBienvenida extends StatelessWidget {
  const TextoBienvenida({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.ph),
          child: Image.asset(
            ImagenesPath.hola,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.pw),
              child: Text(
                l10n.screen_login_greetings,
                style: TextStyle(
                  color: const Color(0xff363636),
                  fontSize: 40.pf,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10.ph),
            Text(
              l10n.screen_login_log_in_to,
              style: TextStyle(
                color: const Color(0xff707070),
                fontSize: 15.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 90.pw,
        )
      ],
    );
  }
}
