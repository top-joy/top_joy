import 'package:dio/dio.dart';
import 'package:top_joy/data/user/models/user_request.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

abstract class UserPostSource {
  Future<void> userPost(UserRequestModel userRequest);
}

class UserPostSourceImpl extends UserPostSource {
  final DioClientRepository dioClientRepository;

  UserPostSourceImpl({
    required this.dioClientRepository,
  });

  @override
  Future<void> userPost(UserRequestModel userRequest) async {
    try {
      final Response response = await dioClientRepository.postData(
        '/api/v1/user',
        userRequest.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send OTP: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('DioError: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
