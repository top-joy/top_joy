import 'package:dartz/dartz.dart';
import 'package:top_joy/data/free_time/models/free_time_model.dart';
import '../repository/free_time_repository.dart';

class FetchFreeTimesUseCase {
  final FreeTimeRepository repository;

  FetchFreeTimesUseCase(this.repository);

  Future<Either<String, List<FreeTime>>> call(String serviceId, DateTime date) async {
    return await repository.fetchFreeTimes(serviceId, date);
  }
}
