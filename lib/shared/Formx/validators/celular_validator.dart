import 'validator.dart';

class CelularValidator<T> extends Validator<T> {
  static final RegExp celularRegex = RegExp(r'^9\d{8}$');

  const CelularValidator({this.errorMessage}) : super();

  final String? errorMessage;

  @override
  String? validate(T value) {
    final String error = errorMessage ?? 'Ingrese un número de celular válido';

    return (value == null ||
            value.toString().isEmpty ||
            celularRegex.hasMatch(value.toString()))
        ? null
        : error;
  }
}
