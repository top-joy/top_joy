import 'package:top_joy/domain/auth/entity/auth_requests.dart';

abstract class AuthRepository {
  Future<void> sendOTP(AuthRequest request);
}
