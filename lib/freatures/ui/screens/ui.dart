import 'package:flutter/material.dart';
import 'package:loginprueba/shared/Formx/formx.dart';
import 'package:loginprueba/shared/custom_button.dart';
import 'package:loginprueba/shared/custom_text_field.dart';

class Ui extends StatelessWidget {
  const Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                value: FormxInput(value: ''),
                label: 'Ingrese su usuario',
                onChanged: (value) {},
                hintText: 'Usuario',
              ),
              SizedBox(height: 20),
              CustomTextField(
                value: FormxInput(value: ''),
                label: 'Ingrese su contraseña',
                onChanged: (value) {},
                hintText: 'Contraseña',
                isPassword: true,
              ),
              CustomButton(
                textButton: 'Iniciar sesión',
                onPressed: () {},
                withShadow: true,
                type: CustomButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
