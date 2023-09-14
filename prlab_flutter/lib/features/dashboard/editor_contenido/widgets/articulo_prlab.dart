import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/hover_delete_icon_prlab.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template  PaginaDeArticuloPRLab}
/// Elemento de la lista que representa un pagina o característica
///  de los articulos que se puede presionar para abrirlo y permitir su edición.
/// Tiene sus factory, permite la creación de distintos articulos.
/// [PaginaDeArticuloPRLab].
/// {@endtemplate}
class PaginaDeArticuloPRLab extends StatefulWidget {
  /// {@macro PaginaDeArticuloPRLab}
  const PaginaDeArticuloPRLab({
    required this.titulo,
    required this.contenidoArticulo,
    required this.contenido,
    required this.onTap,
    required this.idPagina,
    this.estaSeleccionada = false,
    super.key,
  });

  /// Pagina de articulo factory que recibe un icono, un titulo y un contenido
  /// de la descripcion en la lista de los articulos. Usado para el articulo
  /// home metricas y coverage.
  factory PaginaDeArticuloPRLab.listTile({
    required BuildContext context,
    required PaginaSeccionArticulo paginaSeccionArticulo,
    bool estaSeleccionada = false,
  }) {
    final colores = context.colores;
    return PaginaDeArticuloPRLab(
      estaSeleccionada: estaSeleccionada,
      idPagina: paginaSeccionArticulo.id,
      titulo: paginaSeccionArticulo.titulo,
      contenidoArticulo: paginaSeccionArticulo.titulo,
      onTap: () {
        // TODO(Anyone): poner onTap del articulo home.
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
      contenido: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.pw, vertical: 8.ph),
            child: Center(
              child: SizedBox(
                height: 30.ph,
                width: 30.pw,
                child: Image.asset(
                  paginaSeccionArticulo.icono,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paginaSeccionArticulo.titulo,
                style: TextStyle(
                  fontSize: 10.pf,
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                paginaSeccionArticulo.contenido,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 12.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // TODO(Anyone): Documentar
  final String titulo;
  final String contenidoArticulo;
  final int idPagina;
  final VoidCallback? onTap;
  final Widget? contenido;

  /// Indica si la pagina esta seleccionada por el usuario o no, para cambiar su
  /// color de background y borde.
  final bool? estaSeleccionada;

  @override
  State<PaginaDeArticuloPRLab> createState() => _PaginaDeArticuloPRLabState();
}

class _PaginaDeArticuloPRLabState extends State<PaginaDeArticuloPRLab> {
  /// Indica si la pagina esta seleccionada por el usuario o no, para cambiar su
  /// color de background y borde.
  // final bool _estaSeleccionada = false;

  @override
  Widget build(BuildContext context) {
    return HoverDeleteIconPRLab(
      onTapEliminar: _eliminarPaginaDialog,
      itemEstaSeleccionado: widget.estaSeleccionada!,
      condicionVisibility: widget.titulo != 'Home page',
      contenido: widget.contenido,
      onTapSeleccionar: () => _showErrorDialog(context),
    );
  }

  Future<void> _eliminarPaginaDialog() {
    final l10n = context.l10n;
    final colores = context.colores;
    return showDialog<void>(
      context: context,
      builder: (_) => PRDialog.confirmar(
        titulo: l10n.commonDelete,
        tituloBotonPrimario: l10n.commonContinue,
        tituloBotonSecundario: l10n.commonBack,
        content: Text(
          l10n.pageEditContentEditArticleContainerButtonDeletePage,
          style: TextStyle(
            color: colores.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 15.pf,
          ),
        ),
        context: context,
        onTapBotonPrimario: () {
          context.read<BlocEditorContenido>().add(
                BlocEditorContenidoEventoEliminarPaginaArticulo(
                  idPagina: widget.idPagina,
                ),
              );
          Navigator.of(_).pop();
        },
        onTapBotonSecundario: () {
          Navigator.of(_).pop();
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => const PRDialogErrorNoDisponible(),
    );
  }
}
