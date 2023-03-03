import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final Response<String> response = await _dio.post<String>(
        'http://localhost:8000/api/registro/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "nombre": username,
          "email": email,
          "password": password,
        },
      );

      _logger.i(response.data);
    } catch (err) {
      _logger.e(err);
    }
  }
}
