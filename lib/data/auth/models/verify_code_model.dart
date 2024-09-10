import 'package:top_joy/domain/auth/entity/verify_code.dart';

class VerifyCodeModel extends VerifyCode {
  VerifyCodeModel(super.phoneNumber, super.code);

  Map<String, dynamic> toJson() {
    return {"code": code, "exist": true, "phone_number": phoneNumber};
  }
}
