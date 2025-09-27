import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginprueba/config/routes/app_router.dart';
import 'package:loginprueba/freatures/login/models/login_response_model.dart';
import 'package:loginprueba/freatures/login/services/login_service.dart';
import 'package:loginprueba/shared/Formx/formx.dart';
import 'package:loginprueba/shared/Formx/validators/validators.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref) : super(LoginState());

  final StateNotifierProviderRef ref;

  initData() async {
    state = state.copyWith(
      username: FormxInput<String>(
        value: '',
        validators: [Validators.required<String>()],
      ),
      password: FormxInput<String>(
        value: '',
        validators: [Validators.required<String>()],
      ),
    );
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    state = state.copyWith(
      username: state.username.touch(),
      password: state.password.touch(),
    );
    if (!Formx.validate([state.username, state.password])) return;

    try {
      final LoginResponse response = await LoginService.login(
        username: state.username.value,
        password: state.password.value,
      );
      state = state.copyWith(user: response.data.user);
      if (response.status == 200) {
        appRouter.go('/home');
      }
    } catch (e) {
      throw Exception('Error en el servicio de login: $e');
    }
  }

  changeUsername(FormxInput<String> username) {
    state = state.copyWith(username: username);
  }

  changePassword(FormxInput<String> password) {
    state = state.copyWith(password: password);
  }
}

class LoginState {
  final FormxInput<String> username;
  final FormxInput<String> password;
  final User? user;

  LoginState({
    this.username = const FormxInput(value: ''),
    this.password = const FormxInput(value: ''),
    this.user,
  });
  LoginState copyWith({
    FormxInput<String>? username,
    FormxInput<String>? password,
    User? user,
  }) => LoginState(
    username: username ?? this.username,
    password: password ?? this.password,
    user: user ?? this.user,
  );
}
