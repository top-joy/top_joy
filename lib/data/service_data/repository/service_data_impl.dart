import 'package:dartz/dartz.dart';
import 'package:top_joy/data/service_data/source/service_data.dart';
import 'package:top_joy/core/error/failure.dart';

import '../../../domain/service_data/reporitory/service_data_repository.dart';
import '../models/service_models.dart';

class ServiceDataRepositoryImpl implements ServiceDataRepository {
  final ServiceData serviceData;

  ServiceDataRepositoryImpl(this.serviceData);

  @override
  Future<Either<Failure, List<ServiceModels>>> getServiceData() async {
    var data = await serviceData.getData();

    return data.fold(
      (error) => Left(error),
      (data) => Right(data),
    );
  }
}
