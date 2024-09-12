import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/favorite/model/favorite_request_model.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';
import 'package:top_joy/domain/favorite/entity/favorite_entity.dart';
import '../../service_data/models/service_models.dart';

abstract class FavoriteSource {
  Future<Either<Failure, void>> addFavorite(FavoriteRequestModel favorite);
  Future<Either<Failure, void>> deleteFavorite(FavoriteEntity favorite);
  Future<Either<Failure, List<ServiceModels>>> getFavorites(String userId);
}

class FavoriteSourceImpl extends FavoriteSource {
  final DioClientRepository dioClientRepository;

  FavoriteSourceImpl(this.dioClientRepository);

  @override
  Future<Either<Failure, void>> addFavorite(FavoriteRequestModel favorite) async {
    try {
      await dioClientRepository.postData('/api/v1/favorite', favorite.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add favorite: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavorite(FavoriteEntity favorite) async {
    try {
      await dioClientRepository.deleteData(
        '/api/v1/favorite?user_id=${favorite.userId}&service_id=${favorite.serviceId}'
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete favorite: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ServiceModels>>> getFavorites(String userId) async {
    try {
      final response = await dioClientRepository.getData('/api/v1/favorites?user_id=$userId');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final services = data['services'] as List<dynamic>?;

        if (services == null || services.isEmpty) {
          return const Left(ServerFailure("Hozircha sevimlilar yo'q"));
        }

        final serviceModels = services
            .map((item) => ServiceModels.fromJson(item as Map<String, dynamic>))
            .toList();

        return Right(serviceModels);
      } else {
        return const Left(ServerFailure('Invalid response format'));
      }
    } catch (e) {
      return Left(ServerFailure('Failed to fetch favorites: ${e.toString()}'));
    }
  }
}
