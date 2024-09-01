import 'package:dartz/dartz.dart';
import 'package:top_joy/core/usecase/usecase.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';

import '../reporitory/service_data_repository.dart';

class GetServiceDataUsercase
    implements UseCase<Either<Failure, List<ServiceModels>>, void> {
  final ServiceDataRepository serviceDataRepository;

  GetServiceDataUsercase(this.serviceDataRepository);

  @override
  Future<Either<Failure, List<ServiceModels>>> call({void params}) async {
    return await serviceDataRepository.getServiceData();
  }
}
