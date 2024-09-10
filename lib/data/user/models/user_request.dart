import 'package:top_joy/domain/user/entity/user_post.dart';

class UserRequestModel extends UserPost {
  UserRequestModel({
    required super.birthday,
    required super.firstName,
    required super.gender,
    required super.lastName,
    required super.phoneNumber,
    required super.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'birthday': birthday,
      'first_name': firstName,
      'gender': gender,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'photo': photo,
    };
  }
}
