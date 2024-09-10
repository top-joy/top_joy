import 'package:top_joy/data/user/models/user_request.dart';
import 'package:top_joy/data/user/source/user_post_source.dart';
import 'package:top_joy/domain/user/entity/user_post.dart';
import 'package:top_joy/domain/user/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserPostSource userPostSource;
  UserRepositoryImpl(this.userPostSource);
  @override
  Future<void> postUser(UserPost userPost) async {
    final user = UserRequestModel(
      birthday: userPost.birthday,
      firstName: userPost.firstName,
      gender: userPost.gender,
      lastName: userPost.lastName,
      phoneNumber: userPost.phoneNumber,
      photo: userPost.photo,
    );
    return await userPostSource.userPost(user);
  }
}
