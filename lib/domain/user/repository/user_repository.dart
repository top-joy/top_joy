import 'package:top_joy/domain/user/entity/user_post.dart';

abstract class UserRepository {
  Future<void> postUser(UserPost userPost);
  Future<void> putUser(UserPost userpost);
}
