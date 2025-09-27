import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apikey {
    final key = dotenv.env['URL_SERVICE'];
    if(key == null || key.isEmpty) {
      throw Exception('URL_SERVICE no encontrado');
    }
    return key;
  }
}
