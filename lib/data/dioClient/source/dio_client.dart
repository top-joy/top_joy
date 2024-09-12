import 'package:dio/dio.dart';
import 'package:top_joy/core/constants/base_url.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options
      ..connectTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..baseUrl = baseUrl;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> add({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> update({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
