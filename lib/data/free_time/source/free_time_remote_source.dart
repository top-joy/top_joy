import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

import '../models/free_time_model.dart';

class FreeTimeRemoteDataSource {
  final DioClientRepository dioClientRepository;

  FreeTimeRemoteDataSource(this.dioClientRepository);

  Future<Either<String, FreeTimesModel>> fetchFreeTimes(
      String serviceId, DateTime date) async {
    try {
      String formattedDateForServer =
          '${date.year}-${_addLeadingZero(date.month)}-${_addLeadingZero(date.day)}';
      final url =
          "/api/v1/requests/free-times?service_id=$serviceId&date=$formattedDateForServer";
      final response = await dioClientRepository.getData(
        url,
      );

      if (response.statusCode == 200) {
        final freeTimesModel = FreeTimesModel.fromJson(response.data);
        return Right(freeTimesModel);
      } else {
        return const Left(
            "Bo'sh vaqtlar bor emas");
      }
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }
}
