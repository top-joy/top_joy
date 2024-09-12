import 'package:dartz/dartz.dart';
import 'package:top_joy/data/free_time/models/free_time_model.dart';

abstract class FreeTimeRepository {
  Future<Either<String, List<FreeTime>>> fetchFreeTimes(String serviceId, DateTime date);
}
