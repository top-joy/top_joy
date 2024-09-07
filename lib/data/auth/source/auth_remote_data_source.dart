import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';
import '../models/auth_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendOTP(AuthRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClientRepository dioClientRepository;
  final Connectivity connectivity;
  AuthRemoteDataSourceImpl(this.dioClientRepository, this.connectivity);

  @override
  Future<void> sendOTP(AuthRequestModel request) async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult[0] == ConnectivityResult.none) {
        throw const NetworkFailure('No internet connection.');
      }

      final response = await dioClientRepository.postData(
        '/api/v1/send-otp',
        request.toJson(),
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to send OTP: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
