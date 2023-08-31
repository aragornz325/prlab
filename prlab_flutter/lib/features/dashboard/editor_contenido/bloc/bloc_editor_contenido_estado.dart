part of 'bloc_editor_contenido.dart';

/// {@template BlocEditorContenidoEstado}

/// {@endtemplate}
@immutable
sealed class BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstado}
  const BlocEditorContenidoEstado._({
    this.logoElegidoCelular,
    this.logoElegidoWeb,
    this.logoSecundarioElegidoCelular,
    this.logoSecundarioElegidoWeb,
    this.descripcionDeArticulo = '',
    this.articulo,
  });

  BlocEditorContenidoEstado.desde(
    BlocEditorContenidoEstado otro, {
    File? logoElegidoCelular,
    Uint8List? logoElegidoWeb,
    File? logoSecundarioElegidoCelular,
    Uint8List? logoSecundarioElegidoWeb,
    String? descripcionDeArticulo,
    Articulo? articulo,
  }) : this._(
          logoElegidoCelular: logoElegidoCelular ?? otro.logoElegidoCelular,
          logoElegidoWeb: logoElegidoWeb ?? otro.logoElegidoWeb,
          logoSecundarioElegidoCelular:
              logoSecundarioElegidoCelular ?? otro.logoSecundarioElegidoCelular,
          logoSecundarioElegidoWeb:
              logoSecundarioElegidoWeb ?? otro.logoSecundarioElegidoWeb,
          descripcionDeArticulo:
              descripcionDeArticulo ?? otro.descripcionDeArticulo,
          articulo: articulo ?? otro.articulo,
        );

  final File? logoElegidoCelular;
  final Uint8List? logoElegidoWeb;
  final File? logoSecundarioElegidoCelular;
  final Uint8List? logoSecundarioElegidoWeb;

  /// El core de el artículo, acá se encuentra toda la información
  /// central del mismo, se pueden subir imagenes, customizar la letra
  /// y más, el string contiene el tipo de archivo `html` donde estan
  /// descriptas todas esas especificaciones.
  final String descripcionDeArticulo;

  /// El articulo a ser editado en la página actual.
  final Articulo? articulo;
}

/// {@template BlocEditorContenidoEstadoInicial}
/// Estado inicial del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoInicial extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoInicial}
  const BlocEditorContenidoEstadoInicial() : super._();
}

/// {@template BlocEditorContenidoEstadoCargando}
/// Estado de carga del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoCargando extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoCargando}
  BlocEditorContenidoEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocEditorContenidoEstadoRecolectandoDatos}
/// Recolecta del [BlocEditorContenido]
/// A medida que el usuario va completando el kyc
/// el estado se va a ir actualizando con la nueva
/// información completada en los campos de texto.
/// {@endtemplate}
class BlocEditorContenidoEstadoRecolectandoDatos
    extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoRecolectandoDatos}
  BlocEditorContenidoEstadoRecolectandoDatos.desde(
    super.otro, {
    super.logoElegidoCelular,
    super.logoElegidoWeb,
    super.logoSecundarioElegidoCelular,
    super.logoSecundarioElegidoWeb,
  }) : super.desde();
}

/// {@template BlocEditorContenidoEstadoExitoso}
/// Estado de exito del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoExitoso extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoExitoso}
  BlocEditorContenidoEstadoExitoso.desde(
    super.otro, {
    required Articulo articulo,
  }) : super.desde(
          articulo: articulo,
        );
}

/// {@template BlocEditorContenidoEstadoFallido}
/// Estado de fallo del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoFallido extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoFallido}
  BlocEditorContenidoEstadoFallido.desde(super.otro) : super.desde();
}

/// {@template BlocEditorContenidoEstadoActualizandoDescripcion}
/// El editor de contenido se encuentra en este estado cuando se
/// va editando la descripcion de dicho contenido, guardamos todos
/// esos cambios dentro del estado para posteriormente subir los
/// cambios a la db.
/// {@endtemplate}
class BlocEditorContenidoEstadoActualizandoDescripcion
    extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoActualizandoDescripcion}
  BlocEditorContenidoEstadoActualizandoDescripcion.desde(
    super.otro, {
    required String descripcionDeArticulo,
  }) : super.desde(descripcionDeArticulo: descripcionDeArticulo);
}
