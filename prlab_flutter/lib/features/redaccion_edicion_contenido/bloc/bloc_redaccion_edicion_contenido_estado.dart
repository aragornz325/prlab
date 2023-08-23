part of 'bloc_redaccion_edicion_contenido.dart';

/// {@template BlocRedaccionEdicionContenidoEstado}

/// {@endtemplate}
@immutable
sealed class BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstado}
  const BlocRedaccionEdicionContenidoEstado._();

  const BlocRedaccionEdicionContenidoEstado.desde() : this._();
}

/// {@template BlocRedaccionEdicionContenidoEstadoInicial}
/// Estado inicial del [BlocRedaccionEdicionContenido].
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEstadoInicial
    extends BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstadoInicial}
  const BlocRedaccionEdicionContenidoEstadoInicial() : super._();
}

/// {@template BlocRedaccionEdicionContenidoEstadoCargando}
/// Estado de carga del [BlocRedaccionEdicionContenido].
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEstadoCargando
    extends BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstadoCargando}
  const BlocRedaccionEdicionContenidoEstadoCargando.desde() : super.desde();
}

/// {@template BlocRedaccionEdicionContenidoEstadoRecolectandoDatos}
/// Recolecta del [BlocRedaccionEdicionContenido]
/// A medida que el usuario va completando el kyc
/// el estado se va a ir actualizando con la nueva
/// información completada en los campos de texto.
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEstadoRecolectandoDatos
    extends BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstadoRecolectandoDatos}
  const BlocRedaccionEdicionContenidoEstadoRecolectandoDatos.desde()
      : super.desde();
}

/// {@template BlocRedaccionEdicionContenidoEstadoExitoso}
/// Estado de exito del [BlocRedaccionEdicionContenido].
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEstadoExitoso
    extends BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstadoExitoso}
  const BlocRedaccionEdicionContenidoEstadoExitoso.desde() : super.desde();
}

/// {@template BlocRedaccionEdicionContenidoEstadoFallido}
/// Estado de fallo del [BlocRedaccionEdicionContenido].
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEstadoFallido
    extends BlocRedaccionEdicionContenidoEstado {
  /// {@macro BlocRedaccionEdicionContenidoEstadoFallido}
  const BlocRedaccionEdicionContenidoEstadoFallido.desde() : super.desde();
}
