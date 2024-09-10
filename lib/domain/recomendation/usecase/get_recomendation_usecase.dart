import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/core/usecase/usecase.dart';
import 'package:top_joy/domain/recomendation/repository/recomendation_repository.dart';

import '../../../data/service_data/models/service_models.dart';

class GetRecomendationUsecase
    implements UseCase<Either<Failure, List<ServiceModels>>, void> {
  RecomendationRepository recomendationRepository;

  GetRecomendationUsecase(this.recomendationRepository);
  @override
  Future<Either<Failure, List<ServiceModels>>> call({void params}) async {
    return await recomendationRepository.getRecomendationData();
  }
}
