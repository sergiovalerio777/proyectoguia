import 'package:loginprueba/config/api/api.dart';
import 'package:loginprueba/freatures/login/models/listar_tareas_response_model.dart';

class TareasService {
  static Future<ListarTareasResponse> listarTareas() async {
    final api = Api();
    try {
      final response = await api.get('/combos/tipos-cliente');
      final listarTareasResponse = ListarTareasResponse.fromJson(response.data);
      return listarTareasResponse;
    } catch (e) {
      throw Exception('Error en el servicio de listar tareas: $e');
    }
  }
  static Future<void> eliminarTarea(int id) async{
    final api = Api();
    try {
      Map<String, dynamic> form = {
        'id': id,
      };
      await api.delete('/tareas/eliminar', data:form);
    } catch (e) {
      throw Exception('Error en el servicio de eliminar tarea: $e');
    }
  }
  static Future<void> crearTarea(String titulo, String? descripcion) async{
    final api = Api();
    try {
      Map<String, dynamic> form = {
        'titulo': titulo,
        'descripcion': descripcion,
      };
      await api.post('/tareas/crear', data:form);
    } catch (e) {
      throw Exception('Error en el servicio de crear tarea: $e');
    }
  }
  static Future<void> editarTarea(int id, String titulo, String? descripcion) async{
    final api = Api();
    try {
      Map<String, dynamic> form = {
        'id': id,
        'titulo': titulo,
        'descripcion': descripcion,
      };
      await api.post('/tareas/editar', data:form);
    } catch (e) {
      throw Exception('Error en el servicio de editar tarea: $e');
    }
  }
}
