abstract class DioClientRepository {
  Future<dynamic> getData(String url);
  Future<dynamic> postData(String url, Map<String, dynamic> data);
  Future<dynamic> updateData(String url, Map<String, dynamic> data);
  Future<dynamic> deleteData(String url);
}
