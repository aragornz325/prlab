bool soloLetras(String input) {
  // Expresión regular para utilizar solo letras
  return RegExp(r'^[a-zA-ZÀ-ÿ]+$').hasMatch(input);
}
