import 'package:top_joy/domain/auth/entity/check_user.dart';
import 'package:top_joy/domain/auth/entity/verify_code.dart';

abstract class VerifyCodeRepository {
  Future<void> verifyCode(VerifyCode verifyCode);
  Future<void> checkUser(CheckUser checkUser);
}
