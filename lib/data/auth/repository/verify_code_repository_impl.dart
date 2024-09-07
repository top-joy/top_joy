import 'package:top_joy/data/auth/models/verify_code_model.dart';
import 'package:top_joy/data/auth/source/verify_code_source.dart';
import 'package:top_joy/domain/auth/entity/verify_code.dart';
import 'package:top_joy/domain/auth/repository/verify_code_repository.dart';

class VerifyCodeRepositoryImpl extends VerifyCodeRepository {
  final VerifyCodeSource verifyCodeSource;
  VerifyCodeRepositoryImpl(this.verifyCodeSource);
  @override
  Future<void> verifyCode(VerifyCode verifyCode) async {
    final verifyCodeModel =
        VerifyCodeModel(verifyCode.phoneNumber, verifyCode.code);
    return await verifyCodeSource.verifyCode(verifyCodeModel);
  }
}
