/// Trae las primeras letras del email/correo antes del arroba las primeras
/// 3 letras ejemplo: example@test.com
/// trae : exa
String obtenerPrimerasLetrasAntesSimbolo(String email) {
  final indexOfAt = email.indexOf('@');
  return switch (indexOfAt) {
    1 => email.substring(0, 1),
    2 => email.substring(0, 2),
    _ => email.substring(0, 3),
  };
}

/// trae el tipo de email/correo electrónico después del @ para saber si es
/// gmail,hotmail,etc.
/// ejem: example@test.com
/// trae: @test.com
String obtenerTextoDespuesSimbolo(String email) {
  final indexOfAt = email.indexOf('@');
  return email.substring(indexOfAt + 1);
}
