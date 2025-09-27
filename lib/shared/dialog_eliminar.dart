import 'package:flutter/material.dart';
import 'package:loginprueba/shared/custom_button.dart';

class DialogEliminar extends StatelessWidget {
  const DialogEliminar({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 250),
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
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Center(
                child: const Text(
                  'Eliminar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  '¿Estás seguro que deseas eliminar el archivo? Esta acción no se puede deshacer',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      textButton: 'Cancelar',
                      type: CustomButtonType.outline,
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      textButton: 'Eliminar',
                      type: CustomButtonType.primary,
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
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
