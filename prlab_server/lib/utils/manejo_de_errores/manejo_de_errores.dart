import 'dart:io';

/// Enum propio para manejo de errores.
enum ErrorPrLab implements Exception {
  // TODO(anyone): agregar errores propios especificos.

  /// Bad Request.
  errorDePeticion(
    codigoDeEstado: HttpStatus.badRequest,
    mensaje: 'Error in request.',
  ),

  /// Unauthorized.
  errorNoAutorizado(
    codigoDeEstado: HttpStatus.unauthorized,
    mensaje: 'Unauthorized access.',
  ),

  /// Forbidden.
  errorAccesoRestringido(
    codigoDeEstado: HttpStatus.forbidden,
    mensaje: 'Access not allowed.',
  ),

  /// Not Found.
  errorElementoNoEncontrado(
    codigoDeEstado: HttpStatus.notFound,
    mensaje: 'Element not found.',
  ),

  /// Request Timeout.
  errorTiempoExcedido(
    codigoDeEstado: HttpStatus.requestTimeout,
    mensaje: 'Request time exceeded.',
  ),

  /// Too Many Requests.
  errorDemasiadasPeticiones(
    codigoDeEstado: HttpStatus.tooManyRequests,
    mensaje: 'Too many requests.',
  ),

  /// Internal Server Error.
  errorInternoDelServidor(
    codigoDeEstado: HttpStatus.internalServerError,
    mensaje: 'Internal Server Error.',
  ),

  /// Not Implemented.
  errorNoImplementado(
    codigoDeEstado: HttpStatus.notImplemented,
    mensaje: 'Not implemented.',
  ),

  /// Bad Gateway.
  errorDuranteEnlace(
    codigoDeEstado: HttpStatus.badGateway,
    mensaje: 'Error during gateway. Invalid response.',
  ),

  /// Service Unavailable.
  errorServicioNoDisponible(
    codigoDeEstado: HttpStatus.serviceUnavailable,
    mensaje: 'Service not available.',
  ),

  /// Gateway Timeout.
  errorTiempoDeEsperaExcedido(
    codigoDeEstado: HttpStatus.gatewayTimeout,
    mensaje: 'Waiting time exceeded.',
  );

  const ErrorPrLab({
    required this.codigoDeEstado,
    required this.mensaje,
  });

  /// Codigo de estado HTTP.
  final int codigoDeEstado;

  /// Mensaje descriptivo.
  final String mensaje;
}
