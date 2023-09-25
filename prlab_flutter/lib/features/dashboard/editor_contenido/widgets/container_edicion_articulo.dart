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
import 'package:prlab_flutter/utilidades/utilidades.dart';

/// {@template ContainerEdicionArticulo}
/// Permite la edicion del titulo, descripcion del articulo, agregar logos,
/// [ContainerEdicionArticulo].
/// {@endtemplate}
class ContainerEdicionArticulo extends StatelessWidget {
  /// {@macro ContainerEdicionArticulo}
  const ContainerEdicionArticulo({
    super.key,
  });

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
              return _CampoDeTextoTitulo(titulo: state.articulo?.titulo ?? '');
            },
          ),
          const Divider(
            height: 0,
          ),
          const EditorDeDescripcionDeContenido(),
        ],
      ),
    );
  }
}

class _CampoDeTextoTitulo extends StatefulWidget {
  const _CampoDeTextoTitulo({required this.titulo});
  final String titulo;

  @override
  State<_CampoDeTextoTitulo> createState() => _CampoDeTextoTituloState();
}

class _CampoDeTextoTituloState extends State<_CampoDeTextoTitulo> {
  final controller = TextEditingController();

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

  /// Genera una espera antes guardar la nueva data del titulo
  /// en la db para mejorar la performance.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _actualizarTitulo();

    controller.text = widget.titulo;
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
                controller.text = state.articulo?.titulo ?? controller.text;
              }
            },
            child: TextField(
              controller: controller,
              onChanged: _onChanged,
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
