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
  });

  BlocEditorContenidoEstado.desde(
    BlocEditorContenidoEstado otro, {
    File? logoElegidoCelular,
    Uint8List? logoElegidoWeb,
    File? logoSecundarioElegidoCelular,
    Uint8List? logoSecundarioElegidoWeb,
    String? descripcionDeArticulo,
  }) : this._(
          logoElegidoCelular: logoElegidoCelular ?? otro.logoElegidoCelular,
          logoElegidoWeb: logoElegidoWeb ?? otro.logoElegidoWeb,
          logoSecundarioElegidoCelular:
              logoSecundarioElegidoCelular ?? otro.logoSecundarioElegidoCelular,
          logoSecundarioElegidoWeb:
              logoSecundarioElegidoWeb ?? otro.logoSecundarioElegidoWeb,
          descripcionDeArticulo:
              descripcionDeArticulo ?? otro.descripcionDeArticulo,
        );

  final File? logoElegidoCelular;
  final Uint8List? logoElegidoWeb;
  final File? logoSecundarioElegidoCelular;
  final Uint8List? logoSecundarioElegidoWeb;
  final String descripcionDeArticulo;
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
  BlocEditorContenidoEstadoExitoso.desde(super.otro) : super.desde();
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
