import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:top_joy/data/auth/models/verify_code_model.dart';
import 'package:top_joy/domain/auth/entity/check_user.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';
import 'package:top_joy/data/user/models/user_model.dart';

abstract class VerifyCodeSource {
  Future<void> verifyCode(VerifyCodeModel requests);
  Future<void> checkUser(CheckUser requests);
}

class VerifyCodeSourceImpl extends VerifyCodeSource {
  final DioClientRepository dioClientRepository;
  final Box<UserModel> userBox;

  VerifyCodeSourceImpl(this.dioClientRepository, this.userBox);

  @override
  Future<void> verifyCode(VerifyCodeModel requests) async {
    try {
      final response = await dioClientRepository.postData(
        '/api/v1/verify-code',
        requests.toJson(),
      );

      if (response.statusCode != 200) {
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

  @override
  Future<void> checkUser(CheckUser requests) async {
    try {
      final response = await dioClientRepository.getData(
          '/api/v1/user/by-phone-number?phone_number=%2B${requests.phoneNumber}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        UserModel user = UserModel.fromJson(responseData);

        await userBox.put('user', user);
      } else {
        throw Exception(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'Xato: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
