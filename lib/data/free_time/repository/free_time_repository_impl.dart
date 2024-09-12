import 'package:dartz/dartz.dart';
import 'package:top_joy/data/free_time/models/free_time_model.dart';
import 'package:top_joy/data/free_time/source/free_time_remote_source.dart';
import 'package:top_joy/domain/free_time/repository/free_time_repository.dart';

class FreeTimeRepositoryImpl implements FreeTimeRepository {
  final FreeTimeRemoteDataSource remoteDataSource;

  FreeTimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, List<FreeTime>>> fetchFreeTimes(String serviceId, DateTime date) async {
    final result = await remoteDataSource.fetchFreeTimes(serviceId, date);
    return result.fold(
      (failure) => Left(failure),
      (freeTimesModel) => Right(freeTimesModel.freeTimes),
    );
  }
}
