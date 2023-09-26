import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

/// {@template ContainerEdicionArticulo}
/// Permite la edicion del titulo, descripcion del articulo, agregar logos,
/// [ContainerEdicionArticulo].
/// {@endtemplate}
class ContainerEdicionArticulo extends StatefulWidget {
  /// {@macro ContainerEdicionArticulo}
  const ContainerEdicionArticulo({
    super.key,
  });

  @override
  State<ContainerEdicionArticulo> createState() =>
      _ContainerEdicionArticuloState();
}

class _ContainerEdicionArticuloState extends State<ContainerEdicionArticulo> {
  final controller = TextEditingController();

  // Nos ayuda a mantener una conexión persistente y
  // se reconecta automáticamente si perdemos la conexión con el servidor.
  late final StreamingConnectionHandler connectionHandler;

  /// A medida que el usuario va escribiendo el titulo del [Articulo]
  /// se va guardando en la lista las versiones anteriores del mismo.
  ///
  /// Esto permite condicionar si la información que llega del stream fue
  /// o no escrita por el usuario actual, para no pisar los datos del estado.
  ///
  /// Ej:
  /// Se escribe `hola`
  /// Lista : [`h`, `ho`, `hol`, `hola`].
  final List<String> versionesDelTitulo = [];

  /// A medida que el usuario va escribiendo el contenido del [Articulo]
  /// se va guardando en la lista las versiones anteriores del mismo.
  ///
  /// Esto permite condicionar si la información que llega del stream fue
  /// o no escrita por el usuario actual, para no pisar los datos del estado.
  ///
  /// Ej:
  /// Se escribe `hola`
  /// Lista : [`h`, `ho`, `hol`, `hola`].
  final List<String> versionesDelContenido = [];

  /// Genera una espera antes guardar la nueva data del titulo
  /// en la db para mejorar la performance.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    // Configura nuestro controlador de conexión y abre una conexión
    // de streaming al servidor. El [StreamingConnectionHandler] intentará
    // volver a conectarse hasta que se llama al método `close`.
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (_) {},
    );

    connectionHandler.connect();

    _actualizarTitulo();
  }

  @override
  void dispose() {
    controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Maneja cada actualización del servidor a medida que llega.
  ///
  /// Si un [Articulo] fue actualizado por otro cliente, se actualiza
  /// dentro del [Bloc].
  Future<void> _actualizarTitulo() async {
    await for (final actualizado in client.articulo.stream) {
      if (actualizado is Articulo) {
        if (!versionesDelTitulo.contains(actualizado.titulo)) {
          versionesDelTitulo.clear();

          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoActualizarArticulo(
                  titulo: actualizado.titulo,
                  seActualizaDesdeStream: true,
                ),
              );
        }

        if (!versionesDelContenido.contains(actualizado.contenido)) {
          versionesDelContenido.clear();

          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoActualizarArticulo(
                  descripcionDeArticulo: actualizado.contenido,
                  seActualizaDesdeStream: true,
                ),
              );
        }
      }
    }
  }

  void _onChanged(String value) {
    versionesDelTitulo.add(value);

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<BlocEditorContenido>().add(
            BlocEditorContenidoEventoActualizarArticulo(
              titulo: controller.text,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 839.pw,
      height: max(508.ph, 508.sh),
      color: colores.surfaceTint,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadLogoPR(),
            ],
          ),
          const Divider(
            height: 0,
          ),
          BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
            builder: (context, state) {
              return _CampoDeTextoTitulo(
                titulo: state.articulo?.titulo ?? '',
                controller: controller,
                onChanged: _onChanged,
              );
            },
          ),
          const Divider(
            height: 0,
          ),
          EditorDeDescripcionDeContenido(
            onChanged: versionesDelContenido.add,
          ),
        ],
      ),
    );
  }
}

class _CampoDeTextoTitulo extends StatefulWidget {
  const _CampoDeTextoTitulo({
    required this.titulo,
    required this.controller,
    required this.onChanged,
  });
  final String titulo;

  final TextEditingController controller;

  final void Function(String value) onChanged;

  @override
  State<_CampoDeTextoTitulo> createState() => _CampoDeTextoTituloState();
}

class _CampoDeTextoTituloState extends State<_CampoDeTextoTitulo> {
  @override
  void initState() {
    widget.controller.text = widget.titulo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

    return SizedBox(
      height: max(90.ph, 90.sh),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.pw,
          vertical: 15.ph,
        ),
        child: Center(
          child: BlocListener<BlocEditorContenido, BlocEditorContenidoEstado>(
            listener: (context, state) {
              if (state is BlocEditorContenidoEstadoActualizandoDesdeStream) {
                widget.controller.text =
                    state.articulo?.titulo ?? widget.controller.text;
              }
            },
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              style: TextStyle(
                height: max(1.ph, 1.sh),
                fontWeight: FontWeight.w500,
                fontSize: 25.pf,
                color: colores.secondary,
              ),
              decoration: InputDecoration(
                hintText: l10n.pageEditContentEditArticleContainerHintTitle,
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25.pf,
                  color: colores.secondary,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
