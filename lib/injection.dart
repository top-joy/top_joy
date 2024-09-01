import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:top_joy/data/banner/repository/banner_repository_impl.dart';
import 'package:top_joy/data/banner/source/banner_service.dart';
import 'package:top_joy/data/service_data/repository/service_data_impl.dart';
import 'package:top_joy/data/service_data/source/service_data.dart';
import 'package:top_joy/domain/banner/repository/banner_repository.dart';
import 'package:top_joy/domain/banner/usecase/get_banners.dart';
import 'package:top_joy/domain/service_data/reporitory/service_data_repository.dart';
import 'package:top_joy/domain/service_data/usecase/get_service_data.dart';

final GetIt getIt = GetIt.instance;
void setUp() {
  final dio = Dio();
  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<BannerService>(
    BannerServiceImpl(dio),
  );
  getIt.registerSingleton<BannerRepository>(
    BannerRepositoryImpl(getIt<BannerService>()),
  );
  getIt.registerSingleton<GetBannersUsecase>(
    GetBannersUsecase(getIt<BannerRepository>()),
  );

  getIt.registerSingleton<ServiceData>(
    ServiceDataImpl(dio),
  );
  getIt.registerSingleton<ServiceDataRepository>(
    ServiceDataRepositoryImpl(getIt<ServiceData>()),
  );
  getIt.registerSingleton<GetServiceDataUsercase>(
    GetServiceDataUsercase(getIt<ServiceDataRepository>()),
  );
}
