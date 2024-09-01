import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:top_joy/core/constants/base_url.dart';
import '../../../core/error/failure.dart';
import '../models/banner_model.dart';

abstract class BannerService {
  Future<Either<Failure, BannerModel>> getBanners();
}

class BannerServiceImpl implements BannerService {
  final Dio dio;

  BannerServiceImpl(this.dio);

  @override
  Future<Either<Failure, BannerModel>> getBanners() async {
    final url = "$baseUrl/api/v1/banner";

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final bannerModel = BannerModel.fromJson(data);
        return Right(bannerModel);
      } else {
        return Left(Failure('Failed to load banners: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Failure('Error fetching banners: $e'));
    }
  }
}
