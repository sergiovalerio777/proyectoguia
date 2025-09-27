import 'validator.dart';

class EmailValidator<T> extends Validator<T> {
  static final RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  const EmailValidator({this.errorMessage}) : super();

  final String? errorMessage;

  @override
  String? validate(T value) {
    final String error = errorMessage ?? 'Ingrese un correo válido';

    return (value == null ||
            value.toString().isEmpty ||
            emailRegex.hasMatch(value.toString()))
        ? null
        : error;
  }
}
