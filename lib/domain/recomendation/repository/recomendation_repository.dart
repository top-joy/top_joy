import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';
import '../../../data/service_data/models/service_models.dart';

abstract class RecomendationRepository {
  Future<Either<Failure, List<ServiceModels>>> getRecomendationData();
}