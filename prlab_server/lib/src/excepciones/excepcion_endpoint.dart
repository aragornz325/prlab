import 'package:prlab_server/src/generated/protocol.dart';

class ExcepcionEndpoint extends ExcepcionDeEndpoint {
  ExcepcionEndpoint.parseo({
    required super.stackTrace,
    String? titulo,
    String? mensaje,
  }) : super(
          tipoDeError: TipoEndpointExcepcion.parseo,
          titulo: titulo ?? 'Error Code: DATA_PARSING',
          mensaje: mensaje ??
              'It seems that the data you are trying to parse is not '
                  'valid, please check your data and try again.',
        );

  ExcepcionEndpoint.desconocido({
    required super.stackTrace,
    String? titulo,
    String? mensaje,
  }) : super(
          tipoDeError: TipoEndpointExcepcion.desconocido,
          titulo: titulo ?? 'Error Code: UNKNOWN',
          mensaje: mensaje ??
              'It seems that the server is not reachable at the moment, try '
                  'again later, should the issue persist please reach out.',
        );
}
