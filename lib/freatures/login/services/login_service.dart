import 'package:loginprueba/config/api/api.dart';
import 'package:loginprueba/constant/storage_keys.dart';
import 'package:loginprueba/freatures/core/services/storage_service.dart';
import 'package:loginprueba/freatures/login/models/login_response_model.dart';

class LoginService {
  static Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final api = Api();
    try {
      Map<String, dynamic> form = {
        'username': username,
        'password': password,
      };
      final response = await api.post('/auth/login', data:form);
      final authUsuarioResponse = LoginResponse.fromJson(response.data);
      if (authUsuarioResponse.status == 200){
        await StorageService.set(StorageKeys.atk, authUsuarioResponse.data.token);
        await StorageService.set(StorageKeys.usuarioVerify, authUsuarioResponse.data.user.username);
        return authUsuarioResponse;
      } else if (authUsuarioResponse.status == 401){
        return authUsuarioResponse;
      } else {
        throw Exception('Error al autenticar');
      }
    } catch (e) {
      throw Exception('Error en el servicio de login: $e');
    }
  }
}
