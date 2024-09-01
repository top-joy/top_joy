import 'package:dartz/dartz.dart';
import 'package:top_joy/core/error/failure.dart';  // Ensure Failure is imported
import 'package:top_joy/data/service_data/models/service_models.dart';  // Ensure ServiceModels is imported

abstract class ServiceDataRepository {
  Future<Either<Failure, List<ServiceModels>>> getServiceData();
}
