import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loginprueba/freatures/home/components/nueva_tarea_formulario.dart';
import 'package:loginprueba/freatures/login/providers/tareas_provider.dart';
import 'package:loginprueba/shared/custom_button.dart';
import 'package:loginprueba/shared/dialog_eliminar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(listarTareasProvider.notifier).listarTareas();
  }

  @override
  Widget build(BuildContext context) {
    final listarTareasState = ref.watch(listarTareasProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 36,
        flexibleSpace: SafeArea(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.orange, width: 1),
              ),
            ),
            child: Row(
              children: [
                //Image.asset(''),
                SizedBox(width: 10),
                Text('Mis Tareas'),
                Expanded(child: SizedBox()),
                Icon(Icons.more_horiz),

                //SvgPicture.asset('assets/images/icon-menu.svg'),
              ],
            ),
          ),
        ),
      ),

      body:
          (listarTareasState.tareas.isEmpty)
              ? ListarTareas()
              : AccionTareas(listarTareasState: listarTareasState),
    );
  }
}

class AccionTareas extends StatelessWidget {
  const AccionTareas({super.key, required this.listarTareasState});

  final ListarTareasState listarTareasState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (listarTareasState.tareas.isEmpty) ...[
              Icon(Icons.note),
              Text('No Hay tareas'),
              Text('¡Comienza creando tu propia tarea!'),
              SizedBox(height: 20),
            ],

            CustomButton(
              height: 50,
              width: 200,
              iconLeft: Icon(Icons.add, color: Colors.white, size: 30),
              textButton: 'Crear Tarea',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => NuevaTareaFormulario(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListarTareas extends ConsumerWidget {
  const ListarTareas({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final listarTareasState = ref.watch(listarTareasProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lista de Tareas'),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            //itemCount: listarTareasState.tareas.length,
            itemBuilder: (context, index) {
              //final tarea = listarTareasState.tareas[index];
              return Container(
                constraints: BoxConstraints(
                  minHeight: 60,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Titulo'),
                          // Text(tarea.titulo),
                          // if (tarea.descripcion != null) Text('Descripción:'),
                          // Text(tarea.descripcion ?? ''),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        children: [
                          Icon(Icons.edit),
                          GestureDetector(
                            onTap: () async {
                              final bool? confirmado = await showDialog<bool>(
                                context: context,
                                builder: (context) => const DialogEliminar(),
                              );
                              if (confirmado == true) {
                                // ✅ Usuario confirmó eliminar
                                print("Eliminar tarea");
                                // Aquí llamas a tu provider para eliminar
                                // ref.read(listarTareasProvider.notifier).eliminarTarea(tarea.id);
                              } else {
                                // ❌ Usuario canceló
                                print("Canceló la eliminación");
                              }
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
