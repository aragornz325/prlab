/// {@template ExpresionRegular}
/// Esta clase es utilizada para agregar las expresiones regulares que
/// admitiran o restringiran utilizacion de tipos de caracteres.
/// {@endtemplate}
class ExpresionRegular {
  /// {@macro ExpresionRegular}

  /// Expresion regular que solo admite formato email.
  static RegExp get emailRegExp => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/-=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
      );

  /// Expresion regular que solo admite formato letras.
  static RegExp get letrasRegExp => RegExp(r'^[a-zA-ZÀ-ÿ]+$');

  /// Expresion regular que solo admite formato datetime.
  static RegExp get dateTimeRegExp => RegExp(r'^[0-9/-]+$');
}
