import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrLabEmailYBotonEnviar}
/// Muestra el textfield a completar con el email y un boton con el cual enviar
/// al email
/// {@endtemplate}
class PrLabEmailYBotonEnviar extends StatelessWidget {
  /// {@macro PrLabEmailYBotonEnviar}
  @override
  const PrLabEmailYBotonEnviar({
    required this.controller,
    super.key,
  });

  /// controller para el email de [PrLabEmailYBotonEnviar]
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.theme;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.pw,
          vertical: 40.ph,
        ),
        decoration: BoxDecoration(
          //TODO: cambiar cuando este seteado los themas
          color: theme.colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              //TODO: cambiar cuando este seteado los themas
              color: const Color(0xff000000).withOpacity(.25),
            ),
          ],
        ),
        width: 910.ph,
        height: 350.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.screen_create_admin_client_email,
              style: TextStyle(
                //TODO: cambiar cuando este seteado los themas
                color: const Color(0xff363636),
                fontSize: 30.pf,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.ph),
            Text(
              l10n.screen_create_admin_leading_pr_agency,
              style: TextStyle(
                //TODO: cambiar cuando este seteado los themas
                color: const Color(0xff707070),
                fontSize: 15.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50.ph),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.pw),
                height: 40.ph,
                width: 785.pw,
                child: TextFormField(
                  controller: controller,
                ),
              ),
            ),
            SizedBox(height: 50.ph),
            //TODO: cambiarlo por el que esta en development
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.pw),
                width: 785.pw,
                height: 50.pw,
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: agregarle funcionalidad del bloc
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    l10n.screen_create_admin_button_send,
                    style: TextStyle(
                      color: theme.colorScheme.background,
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
