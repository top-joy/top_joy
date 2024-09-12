import 'package:top_joy/data/request/model/request_model.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

abstract class RequestSource {
  Future<void> postRequest(RequestModel request);
}

class RequestSourceImpl extends RequestSource {
  final DioClientRepository dioClientRepository;

  RequestSourceImpl(this.dioClientRepository);

  @override
  Future<void> postRequest(RequestModel request) async {
    try {
      final response = await dioClientRepository.postData(
        '/api/v1/request',
        request.toJson(),
      );
      // Optionally handle the response here if needed
      if (response.statusCode == 200) {
        print(response.data);
        // Handle successful response
      } else {
        // Handle other status codes or errors
        throw Exception('Failed to post request: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle exceptions such as network errors
      print('Error posting request: $e');
      // Optionally rethrow or handle error according to your application's needs
      throw Exception('Error posting request: $e');
    }
  }
}
