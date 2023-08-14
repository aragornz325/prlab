/// {@template validators}
/// A collection of validators used all accross the app.
/// {@endtemplate}
class Validators {
  /// The regular expression for an email.
  static RegExp get emailRegExp => RegExp(
        r"^[a-zA-Z0-9a-zA-Z0-9.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
      );

  /// The regular expression for a password.
  /// The password must contain at least one uppercase letter,
  /// one lowercase letter, one number and one special character.
  /// The password must be at least 8 characters long, and 64 chars max.
  static RegExp get passwordRegExp =>
      RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&~]).{8,64}$');

  /// This should check if the phone is a correct string
  static RegExp get phoneRegExp => RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');

  /// This should check if the input is a correct number
  static RegExp get isNumberRegExp => RegExp(r'^[0-9]+$');

  /// This regExp is used for determine if the input is a double number
  static RegExp get isDoubleRegExp => RegExp(r'^-?\d+(.\d+)$');
}
