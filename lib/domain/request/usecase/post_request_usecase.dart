import 'package:top_joy/domain/request/entity/request_model_entity.dart';
import 'package:top_joy/domain/request/repository/request_post_repository.dart';

class PostRequestUsecase {
  RequestPostRepository repository;
  PostRequestUsecase(this.repository);

  Future<void> postRequest(RequestModelEntity request) async {
    return await repository.postRequest(request);
  }
}
