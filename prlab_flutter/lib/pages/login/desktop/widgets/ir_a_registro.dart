import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

class IrARegistro extends StatelessWidget {
  const IrARegistro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.ph),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.noTenesUnaCuenta,
            style: TextStyle(
              color: const Color(0xff363636),
              fontSize: 12.pf,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            l10n.registrarse,
            style: TextStyle(
              color: const Color(0xffA12B46),
              fontSize: 12.pf,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
