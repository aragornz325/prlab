enum ErrorPrLab implements Exception {

  errorDePeticion(codigoDeEstado: 400, mensaje: 'Error en la petición.'),
  errorNoAutorizado(codigoDeEstado: 401, mensaje: 'Acceso no autorizado.'),
  errorAccesoRestringido(codigoDeEstado: 403, mensaje: 'Acceso no permitido.'),
  errorElementoNoEncontrado(codigoDeEstado: 404, mensaje: 'Elemento no encontrado.'),
  errorTiempoExcedido(codigoDeEstado: 408, mensaje: 'Tiempo de petición excedido.'),
  errorDemasiadasPeticiones(codigoDeEstado: 429, mensaje: 'Demasiadas peticiones realizadas.'),
  errorInternoDelServidor(codigoDeEstado: 500, mensaje: 'Error interno del servidor.'),
  errorNoImplementado(codigoDeEstado: 501, mensaje: 'No implementado.'),
  errorDuranteEnlace(codigoDeEstado: 502, mensaje: 'Error durante enlace. Respuesta inválida.'),
  errorServicioNoDisponible(codigoDeEstado: 503, mensaje: 'Servicio no disponible.'),
  errorTiempoDeEsperaExcedido(codigoDeEstado: 504, mensaje: 'Tiempo de espera excedido.');
  
  const ErrorPrLab({
    required this.codigoDeEstado,
    required this.mensaje,
  });

  final int codigoDeEstado;
  final String mensaje;

}
