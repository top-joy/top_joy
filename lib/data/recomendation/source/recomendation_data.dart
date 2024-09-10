import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/recomendation/models/recomendation_models.dart';
import 'package:top_joy/data/services/location_service.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';
import '../../../core/error/error_handler.dart';
import '../../service_data/models/service_models.dart';

abstract class RecomendationData {
  Future<Either<Failure, List<ServiceModels>>> getData();
}

class RecomendationDataImpl implements RecomendationData {
  final DioClientRepository _dioClientRepository;
  final Connectivity _connectivity;
  final LocationService _locationService;

  RecomendationDataImpl({
    required DioClientRepository dioClientRepository,
    required Connectivity connectivity,
    required LocationService locationService,
  })  : _dioClientRepository = dioClientRepository,
        _connectivity = connectivity,
        _locationService = locationService;

  @override
  Future<Either<Failure, List<ServiceModels>>> getData() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult[0] == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection.'));
      }

      final position = await _locationService.updateAndGetCurrentPosition();

      final url =
          '/api/v1/recommendation-services?latitude=${position.latitude}&longitude=${position.longitude}';
      final response = await _dioClientRepository.getData(url);

      if (response.statusCode == 200) {
        final recomendationModels = RecomendationModels.fromJson(response.data);
        return Right(recomendationModels.services);
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
