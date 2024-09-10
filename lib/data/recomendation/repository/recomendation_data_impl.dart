import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/recomendation/source/recomendation_data.dart';
import 'package:top_joy/domain/recomendation/repository/recomendation_repository.dart';

import '../../service_data/models/service_models.dart';

class RecomendationRepositoryImpl extends RecomendationRepository {
  RecomendationData recomendationData;
  RecomendationRepositoryImpl(this.recomendationData);

  @override
  Future<Either<Failure, List<ServiceModels>>>
      getRecomendationData() async {
    var data = await recomendationData.getData();

    return data.fold(
      (error) => Left(error),
      (data) => Right(data),
    );
  }
}
