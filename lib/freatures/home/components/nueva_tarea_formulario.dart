import 'package:flutter/material.dart';
import 'package:loginprueba/shared/custom_button.dart';

class NuevaTareaFormulario extends StatelessWidget {
  const NuevaTareaFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 400,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Center(
                child: const Text(
                  'Nueva Tarea',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Crea una nueva tarea para tu lista',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Text('Titulo de la tarea'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ej. Hacer Ejercicios',
                ),
              ),
              SizedBox(height: 10),
              Text('Descripción (Opcional)'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ej. ir al Gym',
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      textButton: 'Cancelar',
                      type: CustomButtonType.outline,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      textButton: 'Crear',
                      type: CustomButtonType.primary,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
