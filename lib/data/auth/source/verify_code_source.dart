import 'package:dio/dio.dart';
import 'package:top_joy/data/auth/models/verify_code_model.dart';

abstract class VerifyCodeSource {
  Future<void> verifyCode(VerifyCodeModel requests);
}

class VerifyCodeSourceImpl extends VerifyCodeSource {
  final Dio dio;

  VerifyCodeSourceImpl(this.dio);

  @override
  Future<void> verifyCode(VerifyCodeModel requests) async {
    try {
      final response = await dio.post(
        'https://back.i-bron.uz/ibron/api/v1/verify-code',
        data: requests.toJson(),
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.statusCode);
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
