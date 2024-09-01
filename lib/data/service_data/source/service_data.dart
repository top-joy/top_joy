import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:top_joy/core/error/failure.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';

import '../../../core/constants/base_url.dart';

abstract class ServiceData {
  Future<Either<Failure, List<ServiceModels>>> getData();
}

class ServiceDataImpl implements ServiceData {
  final Dio dio;

  ServiceDataImpl(this.dio);

  @override
  Future<Either<Failure, List<ServiceModels>>> getData() async {
    try {
      final position = await _determinePosition();
      final url =
          '$baseUrl/api/v1/services?longitude=${position.longitude}&latitude=${position.latitude}';
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        // Parse the response data into a list of ServiceModels
        final services = List<ServiceModels>.from(
          response.data['services'].map((x) => ServiceModels.fromJson(x)),
        );
        return Right(services); // Return the list of ServiceModels
      } else {
        return Left(Failure('Failed to load data: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching services: $e');
      return Left(Failure('Error fetching services: $e'));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
