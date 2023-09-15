// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/boton_elegir_imagen_prlab.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/hover_delete_icon_con_imagen.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template UploadLogoPR}
/// Boton para subir logos o imagenes principales y secundarias de la vista de
///  edicion de articulos [UploadLogoPR].
/// {@endtemplate}
class UploadLogoPR extends StatefulWidget {
  /// {@macro UploadLogoPR}
  const UploadLogoPR({
    super.key,
  });

  @override
  State<UploadLogoPR> createState() => _UploadLogoPRState();
}

class _UploadLogoPRState extends State<UploadLogoPR> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: max(64.ph, 64.sh),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.pw),
            child: BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
              builder: (context, state) {
                final imagenLogoPrimarioElegidoWeb = state.logoElegidoWeb;

                final imagenLogoPrimarioElegidoCelular =
                    state.logoElegidoCelular;

                if (imagenLogoPrimarioElegidoWeb != null ||
                    imagenLogoPrimarioElegidoCelular != null) {
                  return HoverDeleteIconConImagen(
                    onTap: () => _eliminarLogoDialog(esLogoPrimario: true),
                    imagenCelular: imagenLogoPrimarioElegidoCelular,
                    imagenWeb: imagenLogoPrimarioElegidoWeb,
                  );
                }
                return BotonElegirImagenPRLab(
                  onTap: () => _elegirImagenLogo(true, context),
                  icon: Icons.file_upload_outlined,
                  descripcionBoton:
                      l10n.pageEditContentEditArticleContainerButtonUploadLogo,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.pw),
            child: BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
              builder: (context, state) {
                final imagenLogoSecundarioElegidoWeb =
                    state.logoSecundarioElegidoWeb;

                final imagenLogoSecundarioElegidoCelular =
                    state.logoSecundarioElegidoCelular;

                if (imagenLogoSecundarioElegidoWeb != null ||
                    imagenLogoSecundarioElegidoCelular != null) {
                  return HoverDeleteIconConImagen(
                    onTap: () => _eliminarLogoDialog(esLogoSecundario: true),
                    imagenCelular: imagenLogoSecundarioElegidoCelular,
                    imagenWeb: imagenLogoSecundarioElegidoWeb,
                  );
                }
                return BotonElegirImagenPRLab(
                  onTap: () => _elegirImagenLogo(false, context),
                  icon: Icons.file_upload_outlined,
                  descripcionBoton: l10n
                      .pageEditContentEditArticleContainerButtonUploadSecondaryLogo,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Muestra un alert dialog al momento de apretar el boton icono de eliminar
  /// logo primario o secundario, para preguntarle por una confirmacion al usuario
  /// y una breve descripcion y de lo que va a hacer.
  Future<void> _eliminarLogoDialog({
    bool esLogoPrimario = false,
    bool esLogoSecundario = false,
  }) {
    final l10n = context.l10n;
    final colores = context.colores;
    return showDialog<void>(
      context: context,
      builder: (_) => PRDialog.confirmar(
        titulo: l10n.commonDelete,
        tituloBotonPrimario: l10n.commonContinue,
        tituloBotonSecundario: l10n.commonBack,
        content: Text(
          l10n.pageEditContentEditArticleContainerButtonDeleteLogo,
          style: TextStyle(
            color: colores.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 15.pf,
          ),
        ),
        context: context,
        onTapBotonPrimario: () {
          if (esLogoPrimario) {
            context.read<BlocEditorContenido>().add(
                  BlocEditorContenidoEventoEliminarImagen(
                    esLogoPrimario: true,
                  ),
                );
          }
          if (esLogoSecundario) {
            context.read<BlocEditorContenido>().add(
                  BlocEditorContenidoEventoEliminarImagen(
                    esLogoSecundario: true,
                  ),
                );
          }

          Navigator.of(_).pop();
        },
        onTapBotonSecundario: () {
          Navigator.of(_).pop();
        },
      ),
    );
  }

  /// Permite elegir una imagen y subirla, para luego mostrarla en la UI,
  /// sirve para el logo primario y secundario el cual se especifica pasandole
  /// el bool.
  Future<void> _elegirImagenLogo(
    bool esLogoPrincipal,
    BuildContext context,
  ) async {
    final picker = ImagePicker();
    if (!kIsWeb) {
      final bloc = context.read<BlocEditorContenido>();
      final imagenCelular = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (imagenCelular != null) {
        final imagenSeleccionada = File(imagenCelular.path);

        esLogoPrincipal
            ? bloc.add(
                BlocEditorContenidoEventoAgregarImagen(
                  logoElegidoCelular: imagenSeleccionada,
                ),
              )
            : bloc.add(
                BlocEditorContenidoEventoAgregarImagen(
                  logoSecundarioElegidoCelular: imagenSeleccionada,
                ),
              );
      } else {
        //Alert dialog, no se pickeo una imagen
      }
    } else if (kIsWeb) {
      final bloc = context.read<BlocEditorContenido>();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        final imagenWeb = await image.readAsBytes();
        esLogoPrincipal
            ? bloc.add(
                BlocEditorContenidoEventoAgregarImagen(
                  logoElegidoWeb: imagenWeb,
                  logoElegidoCelular: File('a'),
                ),
              )
            : bloc.add(
                BlocEditorContenidoEventoAgregarImagen(
                  logoSecundarioElegidoWeb: imagenWeb,
                  logoSecundarioElegidoCelular: File('b'),
                ),
              );
      } else {
        //Alert dialog, no se pickeo una imagen
      }
    } else {
      // TODO(SAM): Alert dialog, algo salio mal
    }
  }
}
