abstract class Validator<T> {
  const Validator();

  Validator.fromFunction(String? Function(String? repetir) contrasenasIgualesValidator);

  /// Validates the [value].
  String? validate(T value);

  String? call(T value) {
    return validate(value);
  }
}
