/// Función que trae las primeras letras del email
String obtenerPrimerasLetrasAntesSimbolo(String email) {
  final indexOfAt = email.indexOf('@');
  return switch (indexOfAt) {
    1 => email.substring(0, 1),
    2 => email.substring(0, 2),
    _ => email  .substring(0, 3),
  };
}

/// Función que trae las ultimas letras despues del @ para saber si es gmail o
/// otro correo electronico
String obtenerTextoDespuesSimbolo(String email) {
  final indexOfAt = email.indexOf('@');
  return email.substring(indexOfAt + 1);
}
