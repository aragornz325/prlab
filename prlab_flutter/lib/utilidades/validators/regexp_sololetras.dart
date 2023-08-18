// TODO(Manu): Cambiar docu a español tambien ver que hay una carpeta de validators
// cambiar el naming a validadores y unificar los validadores en un solo lugar.
bool soloLetras(String input) {
  // Expresión regular para utilizar solo letras
  return RegExp(r'^[a-zA-ZÀ-ÿ]+$').hasMatch(input);
}
