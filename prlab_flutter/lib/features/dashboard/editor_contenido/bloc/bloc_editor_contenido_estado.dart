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
    this.articulo,
    this.eliminarLogoPrimario = false,
    this.eliminarLogoSecundario = false,
    this.listaPaginasDeArticulo = const [],
  });

  BlocEditorContenidoEstado.desde(
    BlocEditorContenidoEstado otro, {
    bool eliminarLogoPrimario = false,
    bool eliminarLogoSecundario = false,
    File? logoElegidoCelular,
    Uint8List? logoElegidoWeb,
    File? logoSecundarioElegidoCelular,
    Uint8List? logoSecundarioElegidoWeb,
    EntregableArticulo? articulo,
    List<PaginaSeccionArticulo>? listaPaginasDeArticulo,
  }) : this._(
          logoElegidoCelular: eliminarLogoPrimario
              ? null
              : logoElegidoCelular ?? otro.logoElegidoCelular,
          logoElegidoWeb: eliminarLogoPrimario
              ? null
              : logoElegidoWeb ?? otro.logoElegidoWeb,
          logoSecundarioElegidoCelular: eliminarLogoSecundario
              ? null
              : logoSecundarioElegidoCelular ??
                  otro.logoSecundarioElegidoCelular,
          logoSecundarioElegidoWeb: eliminarLogoSecundario
              ? null
              : logoSecundarioElegidoWeb ?? otro.logoSecundarioElegidoWeb,
          articulo: articulo ?? otro.articulo,
          listaPaginasDeArticulo:
              listaPaginasDeArticulo ?? otro.listaPaginasDeArticulo,
        );

  /// En caso de ser true permite eliminar el logo primario, convierte a null el
  /// valor de logoPrimario de web y celular.

  final bool eliminarLogoPrimario;

  /// En caso de ser true permite eliminar el logo primario, convierte a null el
  /// valor de logoPrimario de web y celular.
  final bool eliminarLogoSecundario;

  /// Logo primario de celular en su formato correspondiente
  final File? logoElegidoCelular;

  /// Logo primario de web en su formato correspondiente
  final Uint8List? logoElegidoWeb;

  /// Logo secundario de celular en su formato correspondiente
  final File? logoSecundarioElegidoCelular;

  /// Logo secundario de web en su formato correspondiente
  final Uint8List? logoSecundarioElegidoWeb;

  final List<PaginaSeccionArticulo> listaPaginasDeArticulo;

  /// El articulo a ser editado en la página actual.
  final EntregableArticulo? articulo;

  bool get estaEnEstadoDeActualizacion =>
      this is BlocEditorContenidoEstadoActualizandoDescripcion;
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

/// {@template BlocEditorContenidoEstadoActualizandoDesdeStream}
/// TODO(Andre): Agregar docu.
/// {@endtemplate}
class BlocEditorContenidoEstadoActualizandoDesdeStream
    extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoActualizandoDesdeStream}
  BlocEditorContenidoEstadoActualizandoDesdeStream.desde(
    super.otro, {
    required String descripcionDeArticulo,
    required String tituloArticulo,
  }) : super.desde(
          // TODO(anyone): Cuando esten los modelos hechos con mappable,
          // hacer esto con copyWith.
          articulo: EntregableArticulo(
            id: otro.articulo?.id,
            titulo: tituloArticulo,
            contenido: descripcionDeArticulo,
            idProyecto: otro.articulo?.idProyecto,
            idMarca: otro.articulo?.idMarca,
            idAutor: otro.articulo?.idAutor ?? 0,
            idStatus: otro.articulo?.idStatus ?? 0,
            ultimaModificacion:
                otro.articulo?.ultimaModificacion ?? DateTime.now(),
            contenidoHtml: otro.articulo?.contenidoHtml ?? '',
            // fechaEliminacion: otro.articulo?.fechaEliminacion,
            // fechaCreacion: otro.articulo?.fechaCreacion,
            // TODO(Anyone): Volver a agregar cuando se agreguen en el back
            // de nuevo.
          ),
        );
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
    super.articulo,
    super.listaPaginasDeArticulo,
    super.eliminarLogoPrimario,
    super.eliminarLogoSecundario,
  }) : super.desde();
}

/// {@template BlocEditorContenidoEstadoExitoso}
/// Estado de exito del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoExitoso extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoExitoso}
  BlocEditorContenidoEstadoExitoso.desde(
    super.otro, {
    required super.articulo,
    super.logoElegidoCelular,
    super.logoElegidoWeb,
    super.logoSecundarioElegidoCelular,
    super.logoSecundarioElegidoWeb,
    super.listaPaginasDeArticulo,
  }) : super.desde();
}

/// {@template BlocEditorContenidoEstadoError}
/// Estado de fallo del [BlocEditorContenido].
/// {@endtemplate}
class BlocEditorContenidoEstadoError extends BlocEditorContenidoEstado {
  /// {@macro BlocEditorContenidoEstadoError}
  BlocEditorContenidoEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorDeAdministracionMarcas mensajeDeError;
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
    required String tituloArticulo,
  }) : super.desde(
          // TODO(anyone): Cuando esten los modelos hechos con mappable,
          // hacer esto con copyWith.
          // tambien revisar los valores que se les pasa algo por defecto.
          articulo: EntregableArticulo(
            id: otro.articulo?.id,
            titulo: tituloArticulo,
            contenido: descripcionDeArticulo,
            idProyecto: otro.articulo?.idProyecto,
            idMarca: otro.articulo?.idMarca,
            idAutor: otro.articulo?.idAutor ?? 0,
            idStatus: otro.articulo?.idStatus ?? 0,
            ultimaModificacion:
                otro.articulo?.ultimaModificacion ?? DateTime.now(),
            contenidoHtml: otro.articulo?.contenidoHtml ?? '',
            // fechaEliminacion: otro.articulo?.fechaEliminacion,
            // fechaCreacion: otro.articulo?.fechaCreacion,
            // TODO(Anyone): Volver a agregar cuando se agreguen en el back
            // de nuevo.
          ),
        );
}
