import 'package:top_joy/domain/request/entity/request_model_entity.dart';

abstract class RequestPostRepository {
  Future<void> postRequest(RequestModelEntity request);
}
