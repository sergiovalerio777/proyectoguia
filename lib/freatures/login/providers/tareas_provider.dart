import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginprueba/freatures/login/models/listar_tareas_response_model.dart';
import 'package:loginprueba/freatures/login/services/tareas_service.dart';

final listarTareasProvider =
    StateNotifierProvider<ListarTareasNotifier, ListarTareasState>((ref) {
      return ListarTareasNotifier(ref);
    });

class ListarTareasNotifier extends StateNotifier<ListarTareasState> {
  ListarTareasNotifier(this.ref) : super(ListarTareasState());

  final StateNotifierProviderRef ref;

  Future<void> listarTareas() async {
    try {
      final ListarTareasResponse response = await TareasService.listarTareas();
      state = state.copyWith(tareas: response.data.tareas);
    } catch (e) {
      throw Exception('Error en el servicio de listar tareas: $e');
    }
  }

  Future<void> eliminarTarea(int id) async {
    try {
      await TareasService.eliminarTarea(id);
      // Actualiza la lista localmente después de eliminar
      listarTareas();
    } catch (e) {
      throw Exception('Error en el servicio de eliminar tarea: $e');
    }
  }

  Future<void> crearTarea(String titulo, String? descripcion) async {
    try {
      await TareasService.crearTarea(titulo, descripcion);
      // Actualiza la lista localmente después de crear
      listarTareas();
    } catch (e) {
      throw Exception('Error en el servicio de crear tarea: $e');
    }
  }

  Future<void> editarTarea(int id, String titulo, String? descripcion) async {
    try {
      await TareasService.editarTarea(id, titulo, descripcion);
      // Actualiza la lista localmente después de editar
      listarTareas();
    } catch (e) {
      throw Exception('Error en el servicio de editar tarea: $e');
    }
  }
}

class ListarTareasState {
  final List<Tarea> tareas;

  ListarTareasState({this.tareas = const []});
  ListarTareasState copyWith({List<Tarea>? tareas}) {
    return ListarTareasState(tareas: tareas ?? this.tareas);
  }
}
