// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template UploadLogoPR}
/// Boton para subir logos o imagenes principales y secundarias de la vista de
///  edicion de articulos [UploadLogoPR].
/// {@endtemplate}
class UploadLogoPR extends StatelessWidget {
  /// {@macro UploadLogoPR}
  const UploadLogoPR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return SizedBox(
      height: 64.ph,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 30.pw,
            ),
            child: BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
              builder: (context, state) {
                if (state.logoElegidoWeb != null ||
                    state.logoElegidoCelular != null) {
                  return InkWell(
                    // TODO(SAM): Carry over/Agregar hoover para poder borrar.
                    onTap: () => _elegirImagenLogo(
                      true,
                      context,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 24.pf,
                          ),
                          SizedBox(
                            width: 64.pw,
                            height: 64.ph,
                            child: kIsWeb
                                ? Image.memory(
                                    state.logoElegidoWeb!,
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    state.logoElegidoCelular!,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return InkWell(
                  // TODO(SAM): Carry over/ Agregar hoover para poder borrar.
                  onTap: () => _elegirImagenLogo(
                    true,
                    context,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          size: 24.pf,
                        ),
                        Text(
                          l10n.pageEditContentEditArticleContainerButtonUploadLogo,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.pf,
                            color: colores.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.pw),
            child: BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
              builder: (context, state) {
                if (state.logoSecundarioElegidoWeb != null ||
                    state.logoSecundarioElegidoCelular != null) {
                  return InkWell(
                    // TODO(SAM): Agregar hoover para poder borrar.
                    onTap: () => _elegirImagenLogo(
                      false,
                      context,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          size: 24.pf,
                        ),
                        SizedBox(
                          width: 64.pw,
                          height: 64.ph,
                          child: kIsWeb
                              ? Image.memory(
                                  state.logoSecundarioElegidoWeb!,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  state.logoSecundarioElegidoCelular!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ],
                    ),
                  );
                }
                return InkWell(
                  // TODO(SAM): Agregar hoover para poder borrar.
                  onTap: () => _elegirImagenLogo(
                    false,
                    context,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        size: 24.pf,
                      ),
                      Text(
                        l10n.pageEditContentEditArticleContainerButtonUploadSecondaryLogo,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.pf,
                          color: colores.tertiary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
