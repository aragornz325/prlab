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
  // Nos ayuda a mantener una conexión persistente y
  // se reconecta automáticamente si perdemos la conexión con el servidor.
  late final StreamingConnectionHandler connectionHandler;

  /// A medida que el usuario va escribiendo el titulo del [EntregableArticulo]
  /// se va guardando en la lista las versiones anteriores del mismo.
  ///
  /// Esto permite condicionar si la información que llega del stream fue
  /// o no escrita por el usuario actual, para no pisar los datos del estado.
  ///
  /// Ej:
  /// Se escribe `hola`
  /// Lista : [`h`, `ho`, `hol`, `hola`].
  final List<String> versionesDelTitulo = [];

  /// A medida que el usuario va escribiendo el contenido del
  /// [EntregableArticulo] se va guardando en la lista las
  /// versiones anteriores del mismo.
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
    final state = context.read<BlocEditorContenido>().state;

    versionesDelTitulo.add(state.articulo?.titulo ?? '');
    versionesDelContenido.add(state.articulo?.contenido ?? '');

    // Configura nuestro controlador de conexión y abre una conexión
    // de streaming al servidor. El [StreamingConnectionHandler] intentará
    // volver a conectarse hasta que se llama al método `close`.
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (_) {},
    );

    connectionHandler.connect();

    _actualizarArticulo();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  /// Maneja cada actualización del servidor a medida que llega.
  ///
  /// Si un [EntregableArticulo] fue actualizado por otro cliente, se actualiza
  /// dentro del [Bloc].
  Future<void> _actualizarArticulo() async {
    await for (final actualizado in client.entregableArticulo.stream) {
      if (actualizado is EntregableArticulo) {
        if (!versionesDelTitulo.contains(actualizado.titulo)) {
          versionesDelTitulo
            ..clear()
            ..add(actualizado.titulo);

          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoActualizarArticulo(
                  titulo: actualizado.titulo,
                  seActualizaDesdeStream: true,
                ),
              );
        }

        if (!versionesDelContenido.contains(actualizado.contenido)) {
          versionesDelContenido
            ..clear()
            ..add(actualizado.contenido ?? '');

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

  /// Actualiza el titulo en el estado y llama al stream
  /// para actualizar los otros clientes.
  void _onChanged(String value) {
    versionesDelTitulo.add(value);

    final state = context.read<BlocEditorContenido>().state;

    if (state.articulo?.titulo == value) return;

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<BlocEditorContenido>().add(
            BlocEditorContenidoEventoActualizarArticulo(
              titulo: value,
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
          const Divider(height: 0),
          _CampoDeTextoTitulo(onChanged: _onChanged),
          const Divider(height: 0),
          EditorDeDescripcionDeContenido(onChanged: versionesDelContenido.add),
        ],
      ),
    );
  }
}

class _CampoDeTextoTitulo extends StatefulWidget {
  const _CampoDeTextoTitulo({
    required this.onChanged,
  });

  /// Se ejecuta cuando se genera un cambio en el título del
  /// articulo y devuelve el nuevo valor del mismo.
  final void Function(String value)? onChanged;

  @override
  State<_CampoDeTextoTitulo> createState() => _CampoDeTextoTituloState();
}

class _CampoDeTextoTituloState extends State<_CampoDeTextoTitulo> {
  /// Controlador del título de [EntregableArticulo].
  final _controller = TextEditingController();

  /// Focus del título de [EntregableArticulo].
  final _focusNode = FocusNode();

  @override
  void initState() {
    final state = context.read<BlocEditorContenido>().state;

    _controller.text = state.articulo?.titulo ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
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
                if (state.articulo?.titulo == _controller.text) return;

                _controller.text = state.articulo?.titulo ?? _controller.text;

                _focusNode.unfocus();
              }
            },
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
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
