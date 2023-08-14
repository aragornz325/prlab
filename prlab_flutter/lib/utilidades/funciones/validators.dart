/// {@template validators}
/// A collection of validators used all accross the app.
/// {@endtemplate}
class Validators {
  /// The regular expression for an email.
  static RegExp get emailRegExp => RegExp(
        r"^[a-zA-Z0-9a-zA-Z0-9.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
      );
}
