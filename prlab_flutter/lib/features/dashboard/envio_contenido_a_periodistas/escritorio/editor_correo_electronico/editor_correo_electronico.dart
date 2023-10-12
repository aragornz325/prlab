import 'dart:async';
import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_quill/editor_quill.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/bloc/bloc_envio_contenido_a_periodistas.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/escritorio/editor_correo_electronico/utilidades/email_base_html.dart';
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/escritorio/editor_correo_electronico/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

/// {@template EditorCorreoElectronico}
/// Editor de correo electrónico para el envio personalizado
/// de mails de comunicado de prensa a periodistas.
/// {@endtemplate}
@RoutePage(name: 'RutaEditorCorreoElectronico')
class EditorCorreoElectronico extends StatefulWidget {
  /// {@macro EditorCorreoElectronico}
  const EditorCorreoElectronico({super.key});

  @override
  State<EditorCorreoElectronico> createState() =>
      _EditorCorreoElectronicoState();
}

class _EditorCorreoElectronicoState extends State<EditorCorreoElectronico> {
  /// Controllador para el manejo de contenido de un
  /// `EntregableArticulo`.
  late QuillController _controller;

  /// El controllador para el asunto/titulo del mail a enviar.
  late TextEditingController _controllerAsunto;

  /// Genera una espera antes de guardar la nueva data del contenido
  /// en la db para mejorar la performance.
  Timer? _debounce;

  /// Contiene el contenido del articulo en formato `delta`, esto
  /// permite hacer ciertas validaciónes y manejar la información
  /// del mismo.
  String? _jsonDelContenido;

  /// Foco para el contenido del `EntregableArticulo`.
  final _focusNode = FocusNode();

  @override
  void initState() {
    // TODO(anyone): Cuando este el backend de la feat, teoricamente
    // podría traer el contenido ya creado del back

    // final contenidoHtmlEmail =
    //     context.read<BlocEnvioContenidoAPeriodistas>().state.contenidoHtmlEmail;
    // _controller = QuillController(
    // document: Document.fromJson(
    //   jsonDecode(contenidoHtmlEmail) as List,
    // ),
    // selection: const TextSelection.collapsed(offset: 0),
    // );

    _controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );

    _controllerAsunto = TextEditingController();

    _jsonDelContenido = jsonEncode(
      _controller.document.toDelta().toJson(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerAsunto.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Actualiza el contenido del correo electrónico a enviar.
  void _onControllerListener() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _jsonDelContenido = jsonEncode(
        _controller.document.toDelta().toJson(),
      );

      context.read<BlocEnvioContenidoAPeriodistas>().add(
            BlocEnvioContenidoAPeriodistasEventoActualizarEmail(
              contenidoHtmlEmail: _jsonDelContenido,
            ),
          );

      _focusNode.requestFocus();
    });
  }

  void _mostrarPrevisualizacion() => showDialog<void>(
        context: context,
        builder: (_) {
          final contenido = _controller.document.toDelta().toJson();

          final converter = QuillDeltaToHtmlConverter(
            List.castFrom(contenido),
            ConverterOptions.forEmail(),
          );

          final contenidoHtml = converter.convert();

          return PrevisualizacionContenidoDeCorreo(
            htmlData: emailBaseHtml(contenidoHtml),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EncabezadoEditorDeCorreo(
            onVolver: () {
              // TODO(anyone): Completar para ir al paso anterior.
            },
            onSiguiente: () {
              context.read<BlocEnvioContenidoAPeriodistas>().add(
                    BlocEnvioContenidoAPeriodistasEventoActualizarEmail(
                      contenidoHtmlEmail: _jsonDelContenido,
                      asunto: _controllerAsunto.text,
                    ),
                  );
              // TODO(anyone): Completar para ir al paso siguiente.
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.sh).copyWith(
                right: 40.sw,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(color: colores.surfaceTint),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 24.sh).copyWith(
                            left: 30.sw,
                          ),
                          child: Text(
                            l10n.pageSendDeliverablesWriteEmailLabel,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: _mostrarPrevisualizacion,
                          child: Icon(
                            Icons.visibility_outlined,
                            color: colores.primary,
                          ),
                        ),
                        SizedBox(width: 23.sw),
                      ],
                    ),
                    const Divider(height: 0),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10.sh).copyWith(
                            left: 30.sw,
                            right: 10.sw,
                          ),
                          child: Text(
                            l10n.pageSendDeliverablesWriteEmailIssueLabel,
                            style: TextStyle(
                              color: colores.tertiary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerAsunto,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.pw,
                          vertical: 20.sh,
                        ),
                        child: EditorQuill(
                          controller: _controller
                            ..addListener(_onControllerListener),
                          focusNode: _focusNode,
                          showSearchButton: false,
                          showSuperscript: false,
                          showSubscript: false,
                          showIndent: false,
                          showRedo: false,
                          showUndo: false,
                          showFontSize: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
