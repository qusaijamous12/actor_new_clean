import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../error/exceptions.dart';
import 'api_service.dart';
import 'app_endpoints.dart';

class DioClient implements ApiService {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  @override
  Future<Response> get({required String path, Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> post({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(path, queryParameters: query, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException e) {
    if (e.response != null && e.response?.data != null) {
      final String message = e.response?.data['status_message'] ??
                             e.response?.data['message'] ?? 
                             'Something went wrong';
      return ServerException(message, e.response?.statusCode ?? 500);
    } else {
      // Handle different types of Dio errors
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException('Connection Timeout', 408);
        case DioExceptionType.connectionError:
          return NetworkException('No Internet Connection', 0);
        case DioExceptionType.cancel:
          return ServerException('Request Cancelled', 499);
        default:
          return ServerException('Unexpected Error: ${e.message}', 500);
      }
    }
  }
}
