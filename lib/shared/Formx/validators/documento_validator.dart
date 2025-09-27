import 'validator.dart';

class DniValidator<T> extends Validator<T> {
  static final RegExp dniRegex = RegExp(r'^\d{8}$');

  const DniValidator({this.errorMessage}) : super();

  final String? errorMessage;

  @override
  String? validate(T value) {
    final String error = errorMessage ?? 'Ingrese un DNI válido';

    return (value == null ||
            value.toString().isEmpty ||
            dniRegex.hasMatch(value.toString()))
        ? null
        : error;
  }
}
