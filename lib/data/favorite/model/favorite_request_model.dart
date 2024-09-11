import 'package:top_joy/domain/favorite/entity/favorite_entity.dart';

class FavoriteRequestModel extends FavoriteEntity {
  FavoriteRequestModel({required super.serviceId, required super.userId});

  Map<String, dynamic> toJson() {
    return {"service_id": serviceId, "user_id": userId};
  }
}
