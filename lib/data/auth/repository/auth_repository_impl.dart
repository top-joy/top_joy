import 'package:top_joy/data/auth/models/auth_request_model.dart';
import 'package:top_joy/domain/auth/entity/auth_requests.dart';

import '../../../domain/auth/repository/auth_repository.dart';
import '../source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> sendOTP(AuthRequest request) async {
    final otpRequestModel = AuthRequestModel(phoneNumber: request.phoneNumber);
    return await remoteDataSource.sendOTP(otpRequestModel);
  }
}
