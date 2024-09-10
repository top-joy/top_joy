import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:top_joy/core/error/error_handler.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/data/services/location_service.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';

abstract class ServiceData {
  Future<Either<Failure, List<ServiceModels>>> getData();
}

class ServiceDataImpl implements ServiceData {
  final DioClientRepository dioClientRepository;
  final LocationService locationService;
  final Connectivity connectivity;

  ServiceDataImpl({
    required this.dioClientRepository,
    required this.locationService,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, List<ServiceModels>>> getData() async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult[0] == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection.'));
      }

      final position = await locationService.updateAndGetCurrentPosition();
      final url =
          '/api/v1/services?longitude=${position.longitude}&latitude=${position.latitude}';

      final response = await dioClientRepository.getData(url);

      if (response.statusCode == 200) {
        final services = (response.data['services'] as List)
            .map((x) => ServiceModels.fromJson(x))
            .toList();
        return Right(services);
      } else {
        return Left(
            ServerFailure('Failed to load data: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      final failure = ErrorHandler.handleDioError(e);
      return Left(failure);
    } catch (e) {
      log('Error fetching services: $e');
      return Left(ErrorHandler.handleGenericError(e.toString()));
    }
  }
}
