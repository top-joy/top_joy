import 'package:dio/dio.dart';
import 'package:top_joy/data/dioClient/source/dio_client.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

class DioClientRepositoryImpl implements DioClientRepository {
  final DioClient _dioClient;

  DioClientRepositoryImpl(this._dioClient);

  @override
  Future<Response> getData(String url) async {
    return await _dioClient.get(url: url);
  }

  @override
  Future<Response> postData(String url, Map<String, dynamic> data) async {
    return await _dioClient.add(url: url, data: data);
  }

  @override
  Future<Response> updateData(String url, Map<String, dynamic> data) async {
    return await _dioClient.update(url: url, data: data);
  }

  @override
  Future<Response> deleteData(String url) async {
    return await _dioClient.delete(url: url);
  }
}
