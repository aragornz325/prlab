part of 'bloc_editor_contenido.dart';

/// {@template BlocEditorContenidoEstado}

/// {@endtemplate}
@immutable
sealed class BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstado}
  const BlocEditorContenidoEstado._();

  const BlocEditorContenidoEstado.desde() : this._();
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
  const BlocEditorContenidoEstadoCargando.desde() : super.desde();
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
  const BlocEditorContenidoEstadoRecolectandoDatos.desde() : super.desde();
}

/// {@template BlocEditorContenidoEstadoExitoso}
/// Estado de exito del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoExitoso extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoExitoso}
  const BlocEditorContenidoEstadoExitoso.desde() : super.desde();
}

/// {@template BlocEditorContenidoEstadoFallido}
/// Estado de fallo del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoFallido extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoFallido}
  const BlocEditorContenidoEstadoFallido.desde() : super.desde();
}
