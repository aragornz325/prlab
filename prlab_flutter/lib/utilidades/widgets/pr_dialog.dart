import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template TipoDialog}
/// Esto define los tipos de dialog que se puede usar en la clase PRDialog.
/// Cada tipo representa un propósito o mensaje específico que el
/// diálogo pretende transmitir al usuario.
/// {@endtemplate}
enum TipoDialog {
  /// este tipo de dialog/popup se usan para pedirle al usuario una acción en
  /// concreto ej: (una verificacion de codigo dentro de un campo de texto).
  solicitudAccion,

  /// este tipo de dialog/popup se usan para advertir/avisar al usuario.
  advertencia,

  /// este tipo de dialog/popup se usan para darle informacion al usuario.
  informacion,

  /// este tipo de dialog/popup se usan para avisarle de algún tipo de error
  /// al usuario.
  error,

  exito,
}

/// {@template PrLabDialog}
/// PRDialog tiene diferentes tipos de dialog/popup como solicitar la acción
/// del usuario, mostrar información, mostrar advertencias o
/// indicar errores.
/// {@endtemplate}
class PRDialog extends StatelessWidget {
  /// {@macro PrLabDialog}
  @override
  const PRDialog({
    required this.tipo,
    required this.content,
    this.tieneAlturaMinima = true,
    super.key,
    this.height = 285,
    this.width = 455,
  });

  /// `PRDialog.solicitudAccion` donde puede tener un contenido editable para
  /// hacer un tipo de solicitud de acción al usuario
  factory PRDialog.solicitudAccion({
    required String titulo,
    required Widget content,
    required BuildContext context,
    required VoidCallback onTap,
    bool tieneAlturaMinima = true,
    double? height = 285,
    double width = 455,
    bool estaHabilitado = true,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      tieneAlturaMinima: tieneAlturaMinima,
      height: tieneAlturaMinima ? (height?.ph ?? 0) : null,
      width: width.ph,
      tipo: TipoDialog.solicitudAccion,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 360.pw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40.ph),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                    color: colores.tertiary,
                  ),
                ),
                SizedBox(height: 40.ph),
                content,
                SizedBox(height: 40.ph),
                PRBoton.esOutlined(
                  width: 360.pw,
                  estaHabilitado: estaHabilitado,
                  onTap: onTap,
                  texto: l10n.commonSend,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// PRDialog.confirmar es un tipo de dialog de solicitar al usuario que
  /// realice una Accion para eliminar o aceptar algo.
  factory PRDialog.confirmar({
    required String titulo,
    required String tituloBotonPrimario,
    required String tituloBotonSecundario,
    required Widget content,
    required BuildContext context,

    /// Es la funcion que se encuentra en el boton que acepta o confirma
    required VoidCallback onTapBotonPrimario,

    /// Es la funcion que se encuentra en el boton que cancela la operacion
    required VoidCallback onTapBotonSecundario,
    double height = 282,
    double width = 454,
    bool estaHabilitado = true,
  }) {
    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.solicitudAccion,
      content: Column(
        children: [
          SizedBox(
            width: 360.pw,
            child: Column(
              children: [
                SizedBox(height: 40.ph),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                    color: colores.tertiary,
                  ),
                ),
                SizedBox(height: 40.ph),
                Center(child: content),
                SizedBox(height: 40.ph),
                Row(
                  children: [
                    PRBoton.esOutlined(
                      fontSize: 16.pf,
                      fontWeight: FontWeight.w600,
                      width: 170.pw,
                      estaHabilitado: estaHabilitado,
                      onTap: onTapBotonSecundario,
                      texto: tituloBotonSecundario,
                      borderWidth: 2,
                    ),
                    SizedBox(
                      width: max(20.pw, 20.sw),
                    ),
                    PRBoton.esOutlined(
                      fontSize: 16.pf,
                      fontWeight: FontWeight.w600,
                      width: 170.pw,
                      estaHabilitado: estaHabilitado,
                      onTap: onTapBotonPrimario,
                      texto: tituloBotonPrimario,
                      borderWidth: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// `PRDialog.informacion` donde puede tener un contenido editado para
  ///  mostrar el tipo de informacion al usuario
  factory PRDialog.informacion({
    required BuildContext context,
    required VoidCallback onTap,
    required String titulo,
    required Widget content,
    String? botonText,
    double height = 285,
    double width = 455,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.informacion,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.ph),
          Text(
            titulo,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 20.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30.ph),
          content,
          SizedBox(height: 30.ph),
          Center(
            child: PRBoton.esOutlined(
              onTap: onTap,
              texto: botonText ?? l10n.commonOk,
              estaHabilitado: true,
              width: 360.pw,
            ),
          ),
        ],
      ),
    );
  }

  /// `PRDialog.advertencia` Es un tipo de dialog donde se le avisa al usuario
  /// de alguna advertencia
  factory PRDialog.advertencia({
    required BuildContext context,
    required VoidCallback onTap,
    required String titulo,
    required String textoDeAdvertencia,
    required String textButton,
    double height = 285,
    double width = 455,
  }) {
    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.advertencia,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                textoDeAdvertencia,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.esOutlined(
                  onTap: onTap,
                  texto: textButton,
                  estaHabilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// `PRDialog.error` Es un tipo de dialog donde se le avisa al usuario de
  /// algún tipo de error
  factory PRDialog.error({
    required BuildContext context,
    required VoidCallback onTap,
    required Widget contenido,
    double height = 285,
    double width = 455,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.error,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
              l10n.commonError,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            SizedBox(
              width: 360.pw,
              child: contenido,
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.esOutlined(
                  onTap: onTap,
                  texto: l10n.commonBack,
                  estaHabilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// `PRDialog.éxito` Es un tipo de dialog donde se le avisa al usuario que su
  /// petición ha sido exitosa
  factory PRDialog.exito({
    required BuildContext context,
    required VoidCallback onTap,
    required String descripcion,
    double height = 285,
    double width = 455,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.exito,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
              l10n.commonSuccess,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                descripcion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.esOutlined(
                  onTap: onTap,
                  texto: l10n.commonContinue,
                  estaHabilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// `PRDialog.delete` es un tipo de dialog de solicitar al usuario que
  ///  realicé una Accion en este caso eliminar algo.
  factory PRDialog.delete({
    required String titulo,
    required String tituloBotonPrimario,
    required String tituloBotonSecundario,
    required Widget content,
    required BuildContext context,
    required VoidCallback onTapBotonPrimario,
    required VoidCallback onTapBotonSecundario,
    double height = 285,
    double width = 455,
    bool estaHabilitado = true,
  }) {
    final colores = context.colores;

    return PRDialog(
      height: height,
      width: width,
      tipo: TipoDialog.solicitudAccion,
      content: Column(
        children: [
          SizedBox(
            width: 360.pw,
            child: Column(
              children: [
                SizedBox(height: 40.ph),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                    color: colores.tertiary,
                  ),
                ),
                SizedBox(height: 40.ph),
                content,
                SizedBox(height: 40.ph),
                Row(
                  children: [
                    PRBoton.esOutlined(
                      width: 170.pw,
                      estaHabilitado: estaHabilitado,
                      onTap: onTapBotonPrimario,
                      texto: tituloBotonPrimario,
                    ),
                    SizedBox(width: max(20.pw, 20.sw)),
                    PRBoton.esOutlined(
                      width: 170.pw,
                      estaHabilitado: estaHabilitado,
                      onTap: onTapBotonSecundario,
                      texto: tituloBotonSecundario,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// contenido del alertdialog normal de [PRDialog].
  final Widget content;

  /// height del alertdialog [PRDialog].(default: 285)
  final double? height;

  /// width del alertdialog [PRDialog].(default: 455)
  final double width;

  /// tipo de alertdialog [PRDialog].
  final TipoDialog tipo;

  final bool tieneAlturaMinima;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return AlertDialog(
      backgroundColor: colores.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      content: SizedBox(
        height: tieneAlturaMinima ? (height?.ph ?? 0) : null,
        width: width.pw,
        child: content,
      ),
    );
  }
}

/// {@template PRDialogErrorNoDisponible}
/// Muestra un mensaje de error en cualquier caso
/// que la caracteristica solicitada no este desarrollada o disponible.
/// {@endtemplate}
class PRDialogErrorNoDisponible extends StatelessWidget {
  /// {@macro PRDialogErrorNoDisponible}

  const PRDialogErrorNoDisponible({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;

    return PRDialog.informacion(
      onTap: () => Navigator.of(context).pop(),
      context: context,
      titulo: l10n.commonError,
      botonText: l10n.commonBack,
      content: Text(
        l10n.commonFeatureNotAvailable,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.pf,
          color: colores.secondary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
