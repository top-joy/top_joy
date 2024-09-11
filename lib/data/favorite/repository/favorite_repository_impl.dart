import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/favorite/source/favorite_source.dart';
import 'package:top_joy/domain/favorite/entity/favorite_entity.dart';
import 'package:top_joy/domain/favorite/repository/favorite_repository.dart';

import '../../service_data/models/service_models.dart';
import '../model/favorite_request_model.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteSource favoriteSource;

  FavoriteRepositoryImpl(this.favoriteSource);

  @override
  Future<Either<Failure, void>> addFavorite(FavoriteEntity favorite) async {
    try {
      await favoriteSource.addFavorite(
        FavoriteRequestModel(
          userId: favorite.userId,
          serviceId: favorite.serviceId,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavorite(FavoriteEntity favorite) async {
    try {
      await favoriteSource.deleteFavorite(favorite);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceModels>>> getFavorites(
      String userId) async {
    try {
      final favorites = await favoriteSource.getFavorites(userId);
      return favorites;
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
