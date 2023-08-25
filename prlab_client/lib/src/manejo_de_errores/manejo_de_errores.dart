import 'dart:io';

enum ErrorPrLab implements Exception {

  errorDePeticion(codigoDeEstado: HttpStatus.badRequest, mensaje: 'Error in request.'),
  errorNoAutorizado(codigoDeEstado: HttpStatus.unauthorized, mensaje: 'Unauthorized access.'),
  errorAccesoRestringido(codigoDeEstado: HttpStatus.forbidden, mensaje: 'Access not allowed.'),
  errorElementoNoEncontrado(codigoDeEstado: HttpStatus.notFound, mensaje: 'Element not found.'),
  errorTiempoExcedido(codigoDeEstado: HttpStatus.requestTimeout, mensaje: 'Request time exceeded.'),
  errorDemasiadasPeticiones(codigoDeEstado: HttpStatus.tooManyRequests, mensaje: 'Too many requests.'),
  errorInternoDelServidor(codigoDeEstado: HttpStatus.internalServerError, mensaje: 'Internal Server Error.'),
  errorNoImplementado(codigoDeEstado: HttpStatus.notImplemented, mensaje: 'Not implemented.'),
  errorDuranteEnlace(codigoDeEstado: HttpStatus.badGateway, mensaje: 'Error during gateway. Invalid response.'),
  errorServicioNoDisponible(codigoDeEstado: HttpStatus.serviceUnavailable, mensaje: 'Service not available.'),
  errorTiempoDeEsperaExcedido(codigoDeEstado: HttpStatus.gatewayTimeout, mensaje: 'Waiting time exceeded.');
  
  const ErrorPrLab({
    required this.codigoDeEstado,
    required this.mensaje,
  });

  final int codigoDeEstado;
  final String mensaje;
}