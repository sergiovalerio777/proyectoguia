import 'package:dio/dio.dart';
import 'package:loginprueba/config/routes/app_router.dart';
import 'package:loginprueba/constant/environment.dart';
import 'package:loginprueba/constant/storage_keys.dart';
import 'package:loginprueba/freatures/core/services/storage_service.dart';

class Api {
  final Dio _dioBase = Dio(BaseOptions(
    baseUrl: Environment.apikey,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  InterceptorsWrapper interceptor = InterceptorsWrapper();

  Api() {
    interceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          final userToken = await StorageService.get<String>(StorageKeys.atk);
          if (userToken != null && userToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $userToken';
          }
          handler.next(options);
        } catch (e) {
          handler.reject(DioException(
            requestOptions: options,
            error: 'Error al obtener el token: $e',
          ));
        }
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          await StorageService.remove(StorageKeys.atk);
          await StorageService.remove(StorageKeys.usuarioVerify);
          appRouter.go('/login'); // Redirige al login
          //SnackbarService.show('Se ha cerrado Sesión');
        }
        handler.next(e);
      },
    );

    _dioBase.interceptors.add(interceptor);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dioBase.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {Object? data}) async {
    return _dioBase.post(path, data: data);
  }

  Future<Response> delete(String path, {Object? data}) async {
    return _dioBase.delete(path, data: data);
  }
}
