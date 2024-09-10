import 'package:top_joy/domain/auth/entity/auth_requests.dart';
import '../repository/auth_repository.dart';

class SendOTPUseCase {
  final AuthRepository repository;

  SendOTPUseCase(this.repository);

  Future<void> call(AuthRequest request) {
    return repository.sendOTP(request);
  }
}
