import 'package:dio/dio.dart';

class DioClientProvider {
  DioClientProvider({required String baseUrl}) : _baseUrl = baseUrl {
    _createClient();
  }

  final String _baseUrl;
  late final Dio dio;

  Dio _createClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        sendTimeout: const Duration(seconds: 10).inMilliseconds,
        connectTimeout: const Duration(seconds: 10).inMilliseconds,
        receiveTimeout: const Duration(seconds: 10).inMilliseconds,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        request: true,
      ),
    );
    return dio;
  }
}
