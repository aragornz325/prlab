import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
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
    double height = 285,
    double width = 455,
    bool estaHabilitado = true,
  }) {
    final l10n = context.l10n;

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
                  ),
                ),
                SizedBox(height: 40.ph),
                content,
                SizedBox(height: 40.ph),
                PRBoton.outlined(
                  width: 360.pw,
                  habilitado: estaHabilitado,
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

  /// `PRDialog.informacion` donde puede tener un contenido editado para
  ///  mostrar el tipo de informacion al usuario
  factory PRDialog.informacion({
    required BuildContext context,
    required VoidCallback onTap,
    required String titulo,
    required Widget content,
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
            child: PRBoton.outlined(
              onTap: onTap,
              texto: l10n.commonOk,
              habilitado: true,
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
    final l10n = context.l10n;

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
                // TODO(anyone): Cambiar colors a los del theme
                color: Colors.black,
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
                child: PRBoton.outlined(
                  onTap: onTap,
                  texto: textButton,
                  habilitado: true,
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
    required String descripcionError,
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
              child: Text(
                descripcionError,
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
                child: PRBoton.outlined(
                  onTap: onTap,
                  texto: l10n.commonBack,
                  habilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// contenido del alertdialog normal de [PRDialog].
  final Widget content;

  /// height del alertdialog [PRDialog].(default: 285)
  final double height;

  /// width del alertdialog [PRDialog].(default: 455)
  final double width;

  /// tipo de alertdialog [PRDialog].
  final TipoDialog tipo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // TODO(anyone): Cambiar colors a los del theme
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      content: SizedBox(
        height: height.ph,
        width: width.pw,
        child: content,
      ),
    );
  }
}

class TextfieldCodigoDeRecuperarContrasenia extends StatefulWidget {
  const TextfieldCodigoDeRecuperarContrasenia({
    required this.controller,
    required this.email,
    super.key,
  });
  final TextEditingController controller;
  final String email;

  @override
  State<TextfieldCodigoDeRecuperarContrasenia> createState() =>
      _TextfieldCodigoDeRecuperarContraseniaState();
}

class _TextfieldCodigoDeRecuperarContraseniaState
    extends State<TextfieldCodigoDeRecuperarContrasenia> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BlocLogin>().state;
    return PrLabTextfield(
      controller: widget.controller,
      solicitoNuevoCodigo: state is BlocLoginEstadoCronometroCorriendo,
      email: widget.email,
      segundosFaltantes: state.duracionTimer,
    );
  }
}
