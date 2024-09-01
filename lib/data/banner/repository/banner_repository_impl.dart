import 'package:dartz/dartz.dart';
import 'package:top_joy/data/banner/models/banner_model.dart';
import 'package:top_joy/data/banner/source/banner_service.dart';
import 'package:top_joy/domain/banner/repository/banner_repository.dart';
import 'package:top_joy/core/error/failure.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerService bannerService;

  BannerRepositoryImpl(this.bannerService);

  @override
  Future<Either<Failure, BannerModel>> getBanner() async {
    var banners = await bannerService.getBanners();

    return banners.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
