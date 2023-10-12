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
    this.contentPadding,
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
    double? anchoDelBoton,

    /// es la altura que separa entre el boton y el contenido que le vayas a
    /// pasar
    double? alturaEntreBotonYContenido,
    String? tituloDelBoton,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      tieneAlturaMinima: tieneAlturaMinima,
      height: tieneAlturaMinima ? (height?.ph ?? 0) : null,
      width: width.ph,
      tipo: TipoDialog.solicitudAccion,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 360.pw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: max(40.ph, 40.sh)),
                  Text(
                    titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.pf,
                      fontWeight: FontWeight.w600,
                      color: colores.tertiary,
                    ),
                  ),
                  SizedBox(height: max(40.ph, 40.sh)),
                  content,
                  SizedBox(
                    height: alturaEntreBotonYContenido ?? max(40.ph, 40.sh),
                  ),
                  PRBoton.esOutlined(
                    width: anchoDelBoton ?? 360.pw,
                    estaHabilitado: estaHabilitado,
                    onTap: onTap,
                    texto: tituloDelBoton ?? l10n.commonSend,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// `PRDialog.creacion` donde puede tener un contenido editable para
  /// crear algo en especifico tiene un boton de cancel y otro de save
  factory PRDialog.creacion({
    required String titulo,
    required Widget content,
    required BuildContext context,
    required VoidCallback onTapSave,
    required VoidCallback onTapCancel,
    bool tieneAlturaMinima = true,
    double? height = 285,
    double width = 455,
    bool estaHabilitado = true,
    double? anchoDelBoton,
    bool estaCargando = false,

    /// Es la altura que separa entre el boton y el contenido que le vayas a
    /// pasar
    double? alturaEntreBotonYContenido,
    String? tituloDelBoton,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog(
      tieneAlturaMinima: tieneAlturaMinima,
      height: tieneAlturaMinima ? (height?.ph ?? 0) : null,
      width: width.ph,
      tipo: TipoDialog.solicitudAccion,
      content: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: max(10.ph, 10.sh)),
                        Text(
                          titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.pf,
                            fontWeight: FontWeight.w600,
                            color: colores.tertiary,
                          ),
                        ),
                        SizedBox(height: max(10.ph, 10.sh)),
                        content,
                        SizedBox(
                          height:
                              alturaEntreBotonYContenido ?? max(20.ph, 20.sh),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PRBoton.esOutlined(
                width: anchoDelBoton ?? 100.sw,
                height: 30.sh,
                estaHabilitado: estaHabilitado,
                onTap: onTapCancel,
                texto: l10n.commonCancel,
              ),
              SizedBox(width: 60.pw),
              PRBoton(
                estaCargando: estaCargando,
                width: anchoDelBoton ?? 100.sw,
                height: 30.sh,
                onTap: onTapSave,
                texto: tituloDelBoton ?? l10n.commonSend,
                estaHabilitado: true,
              ),
            ],
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
                SizedBox(height: max(40.ph, 40.sh)),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                    color: colores.tertiary,
                  ),
                ),
                SizedBox(height: max(40.ph, 40.sh)),
                Center(child: content),
                SizedBox(height: max(40.ph, 40.sh)),
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
    double alturaEntreContenido = 30,
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
          SizedBox(height: max(20.ph, 20.sh)),
          Text(
            titulo,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 20.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: max(alturaEntreContenido.ph, alturaEntreContenido.sh),
          ),
          content,
          SizedBox(
            height: max(alturaEntreContenido.ph, alturaEntreContenido.sh),
          ),
          Center(
            child: PRBoton.esOutlined(
              onTap: onTap,
              texto: botonText ?? l10n.commonOk,
              estaHabilitado: true,
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
            SizedBox(height: max(20.ph, 20.sh)),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: max(20.ph, 20.sh)),
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
            SizedBox(height: max(20.ph, 20.sh)),
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
            SizedBox(height: max(20.ph, 20.sh)),
            Text(
              l10n.commonError,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: max(30.ph, 30.sh)),
            SizedBox(
              width: 360.pw,
              child: contenido,
            ),
            SizedBox(height: max(30.ph, 30.sh)),
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
            SizedBox(height: max(20.ph, 20.sh)),
            Text(
              l10n.commonSuccess,
              style: TextStyle(
                fontSize: 20.pf,
                color: colores.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: max(30.ph, 30.sh)),
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
            SizedBox(height: max(30.ph, 30.sh)),
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
                SizedBox(height: max(40.ph, 40.sh)),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                    color: colores.tertiary,
                  ),
                ),
                SizedBox(height: max(40.ph, 40.sh)),
                content,
                SizedBox(height: max(40.ph, 40.sh)),
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

  /// El padding que tiene el contenido del popup.
  final EdgeInsets? contentPadding;

  /// Se usa para saber si el dialog debe tener una altura minima o adaptarse a
  /// su contenido
  final bool tieneAlturaMinima;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return AlertDialog(
      backgroundColor: colores.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      contentPadding: contentPadding,
      content: SizedBox(
        height: tieneAlturaMinima ? (height?.ph ?? 0) : null,
        width: width,
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

  /// Stackea el componente en la pantalla donde se ejecute
  /// esta función.
  Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => this,
      );

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
