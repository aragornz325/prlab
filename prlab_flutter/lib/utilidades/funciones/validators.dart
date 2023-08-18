/// {@template validators}
/// A collection of validators used all accross the app.
/// {@endtemplate}
class Validators {
  /// Expresion regular que solo admite formato email.
  static RegExp get emailRegExp => RegExp(
        r"^[a-zA-Z0-9a-zA-Z0-9.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
      );

  /// Expresion regular que solo admite formato letras.
  static RegExp get letrasRegExp => RegExp(r'^[a-zA-ZÀ-ÿ]+$');

  /// Expresion regular que solo admite formato datetime.
  static RegExp get dateTimeRegExp => RegExp(r'^[0-9/-]+$');
}