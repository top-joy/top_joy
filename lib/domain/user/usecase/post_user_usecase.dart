import 'package:top_joy/domain/user/entity/user_post.dart';
import 'package:top_joy/domain/user/repository/user_repository.dart';

class PostUserUsecase {
  UserRepository userRepository;

  PostUserUsecase(this.userRepository);

  Future<void> call(UserPost userPost) async {
    return userRepository.postUser(userPost);
  }
}
