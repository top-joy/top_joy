import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../data/service_data/models/service_models.dart';
import '../entity/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(FavoriteEntity favorite);
  Future<void> deleteFavorite(FavoriteEntity favorite);
  Future<Either<Failure, List<ServiceModels>>> getFavorites(String userId);
}
