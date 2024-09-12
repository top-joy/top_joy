import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/domain/favorite/entity/favorite_entity.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository repository;

  AddFavoriteUseCase(this.repository);

  Future<void> call(FavoriteEntity favorite) {
    return repository.addFavorite(favorite);
  }
}

class DeleteFavoriteUseCase {
  final FavoriteRepository repository;

  DeleteFavoriteUseCase(this.repository);

  Future<void> call(FavoriteEntity favorite) {
    return repository.deleteFavorite(favorite);
  }
}

class GetFavoritesUseCase
    implements UseCase<Either<Failure, List<ServiceModels>>, String> {
  final FavoriteRepository repository;

  GetFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ServiceModels>>> call({String? params}) async {
    return await repository.getFavorites(params!);
  }
}
