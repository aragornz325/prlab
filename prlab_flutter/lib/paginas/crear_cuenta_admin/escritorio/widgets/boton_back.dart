import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrBotonBack}
/// Boton para regresar
/// {@endtemplate}
class PrBotonBack extends StatelessWidget {
  /// {@macro PrBotonBack}
  @override
  const PrBotonBack({
    required this.onPressed,
    super.key,
  });

  /// Funcion para regresar en el boton de [PrBotonBack]
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
        width: 200.pw,
        height: 50.pw,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(color: Color(0xffA12B46)),
            ),
          ),
          child: Text(
            l10n.screen_create_admin_account_button_back,
            style: TextStyle(
              color: const Color(0xffA12B46),
              fontSize: 15.pf,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
