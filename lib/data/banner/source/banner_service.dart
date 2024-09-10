import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/error/failure.dart';
import '../../../domain/dioClient/repositories/dio_client_repository.dart';
import '../models/banner_model.dart';

abstract class BannerService {
  Future<Either<Failure, BannerModel>> getBanners();
}

class BannerServiceImpl implements BannerService {
  final DioClientRepository dioClientRepository;
  final Connectivity connectivity;

  BannerServiceImpl(this.dioClientRepository, this.connectivity);

  @override
  Future<Either<Failure, BannerModel>> getBanners() async {
    // Internet ulanishini tekshirish
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      return const Left(NetworkFailure('Internetga ulanish mavjud emas.'));
    }

    try {
      // API so'rovini yuborish
      final response = await dioClientRepository.getData('/api/v1/banner');

      // Muvaffaqiyatli javobni qayta ishlash
      if (response.statusCode == 200) {
        final bannerModel =
            BannerModel.fromJson(response.data as Map<String, dynamic>);
        return Right(bannerModel);
      } else {
        return Left(ServerFailure(
            'Bannerlarni yuklashda xatolik: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } catch (e) {
      return Left(ErrorHandler.handleGenericError(e.toString()));
    }
  }
}
