import 'package:top_joy/domain/auth/entity/check_user.dart';
import 'package:top_joy/domain/auth/entity/verify_code.dart';
import 'package:top_joy/domain/auth/repository/verify_code_repository.dart';

class VerifyCodeUsecase {
  final VerifyCodeRepository verifyCodeRepository;
  VerifyCodeUsecase(this.verifyCodeRepository);

  Future<void> call(VerifyCode verifyCode) async {
    return await verifyCodeRepository.verifyCode(verifyCode);
  }

  Future<void> checkUser(CheckUser checkUser) async {
    return await verifyCodeRepository.checkUser(checkUser);
  }
}
