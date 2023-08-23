part of 'bloc_administracion_contenido.dart';

//TODO(mati): hacer documentacion
@immutable
abstract class BlocAdministracionContenidoEstado {}

final class BlocAdministracionContenidoEstadoInicial
    extends BlocAdministracionContenidoEstado {}

final class BlocAdministracionContenidoEstadoCargando
    extends BlocAdministracionContenidoEstado {}

final class BlocAdministracionContenidoEstadoExitoso
    extends BlocAdministracionContenidoEstado {}

final class BlocAdministracionContenidoEstadoFallido
    extends BlocAdministracionContenidoEstado {}
