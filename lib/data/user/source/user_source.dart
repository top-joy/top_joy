import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/data/user/models/user_request.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

import '../../../injection.dart';

abstract class UserPostSource {
  Future<void> userPost(UserRequestModel userRequest);
  Future<void> userPut(UserRequestModel userRequest);
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

  @override
  Future<void> userPut(UserRequestModel userRequest) async {
    try {
      var userBox = getIt<Box<UserModel>>();
      UserModel? userModel = userBox.get('user');
      if (userModel == null) {
        throw Exception('User not found or ID is null.');
      }
      
      final response = await dioClientRepository.updateData(
        '/api/v1/user/${userModel.id}',
        userRequest.toJson(),
      );

      if (response.statusCode == 202) {
        print("Update successful");
      } else {
        throw Exception('Failed to update user: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('DioError: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
