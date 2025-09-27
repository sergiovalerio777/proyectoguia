import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loginprueba/freatures/login/providers/login_provider.dart';
import 'package:loginprueba/shared/Formx/formx.dart';
import 'package:loginprueba/shared/custom_button.dart';
import 'package:loginprueba/shared/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(loginProvider.notifier).initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                value: loginState.username,
                onChanged: (value) {
                  ref.read(loginProvider.notifier).changeUsername(value);
                },
                label: 'Ingrese su usuario',
                hintText: 'Usuario',
                icon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              CustomTextField(
                value: loginState.password,
                onChanged: (value) {
                  ref.read(loginProvider.notifier).changePassword(value);
                },
                label: 'Ingrese su contraseña',
                hintText: 'Contraseña',
                isPassword: true,
                icon: Icon(Icons.lock),
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Ingresar',
                onPressed: () {
                  ref.read(loginProvider.notifier).login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
