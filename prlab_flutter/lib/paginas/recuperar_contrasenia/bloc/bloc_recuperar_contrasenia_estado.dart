part of 'bloc_recuperar_contrasenia.dart';

// TODO(Andreas): Cambair la docu por los templates nuevos.
/// {@template bloc_recuperar_contrasenia_estado}
/// Estado que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
@immutable
sealed class BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado}
  const BlocRecuperarContraseniaEstado._({
    this.contrasenia = '',
    this.contraseniaRepetida = '',
  });

  BlocRecuperarContraseniaEstado.desde(
    BlocRecuperarContraseniaEstado otro, {
    String? contrasenia,
    String? contraseniaRepetida,
  }) : this._(
          contrasenia: contrasenia ?? otro.contrasenia,
          contraseniaRepetida: contraseniaRepetida ?? otro.contraseniaRepetida,
        );

  /// Contraseña que va suplantar la contraseña previa del usuario.
  final String contrasenia;

  /// Campo de texto para validar que efectivamente la contraseña se
  /// haya escrito 2 veces, esto minimiza errores de tipeo por
  /// parte del usuario.
  final String contraseniaRepetida;

  /// Si los campos de texto de contraseñas fueron completados.
  bool get estanCompletasLasContrasenias =>
      contrasenia.isNotEmpty && contraseniaRepetida.isNotEmpty;

  // TODO(Andreas): Agregar docu de los getters
  bool get esEstadoCargando => this is BlocRecuperarContraseniaEstadoCargando;

  bool get esEstadoFallido => this is BlocRecuperarContraseniaEstadoFallido;

  bool get esEstadoExitoso => this is BlocRecuperarContraseniaEstadoExitoso;
}

/// {@template bloc_recuperar_contrasenia_estado_inicial}
/// Estado inicial del [BlocRecuperarContrasenia].
/// {@endtemplate}
class BlocRecuperarContraseniaEstadoInicial
    extends BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado_inicial}
  const BlocRecuperarContraseniaEstadoInicial() : super._();
}

/// {@template bloc_recuperar_contrasenia_estado_cargando}
/// Estado cargando del [BlocRecuperarContrasenia].
/// {@endtemplate}
class BlocRecuperarContraseniaEstadoCargando
    extends BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado_cargando}
  BlocRecuperarContraseniaEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template bloc_recuperar_contrasenia_estado_recolectar_data}
/// Estado de recolar data del [BlocRecuperarContrasenia].
/// Sirve para actualizar los datos de los campos de contraseña
/// dentro del estado [BlocRecuperarContraseniaEstado].
/// {@endtemplate}
class BlocRecuperarContraseniaEstadoRecolectarData
    extends BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado_recolectar_data}
  BlocRecuperarContraseniaEstadoRecolectarData.desde(
    super.otro, {
    super.contrasenia,
    super.contraseniaRepetida,
  }) : super.desde();
}

/// {@template bloc_recuperar_contrasenia_estado_exitoso}
/// Estado de exito del [BlocRecuperarContrasenia].
/// {@endtemplate}
class BlocRecuperarContraseniaEstadoExitoso
    extends BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado_exitoso}
  BlocRecuperarContraseniaEstadoExitoso.desde(super.otro) : super.desde();
}

/// {@template bloc_recuperar_contrasenia_estado_fallido}
/// Estado de fallo del [BlocRecuperarContrasenia].
/// {@endtemplate}
class BlocRecuperarContraseniaEstadoFallido
    extends BlocRecuperarContraseniaEstado {
  /// {@macro bloc_recuperar_contrasenia_estado_fallido}
  BlocRecuperarContraseniaEstadoFallido.desde(super.otro) : super.desde();
}
