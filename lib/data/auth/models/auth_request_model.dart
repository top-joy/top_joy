import 'package:top_joy/domain/auth/entity/auth_requests.dart';

class AuthRequestModel extends AuthRequest {
  AuthRequestModel({required String phoneNumber}) : super(phoneNumber);

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
    };
  }

}
