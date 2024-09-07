import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/data/auth/repository/auth_repository_impl.dart';
import 'package:top_joy/data/auth/repository/verify_code_repository_impl.dart';
import 'package:top_joy/data/auth/source/auth_remote_data_source.dart';
import 'package:top_joy/data/auth/source/verify_code_source.dart';
import 'package:top_joy/data/banner/repository/banner_repository_impl.dart';
import 'package:top_joy/data/banner/source/banner_service.dart';
import 'package:top_joy/data/dioClient/repositories/dio_client_repository_impl.dart';
import 'package:top_joy/data/dioClient/source/dio_client.dart';
import 'package:top_joy/data/recomendation/repository/recomendation_data_impl.dart';
import 'package:top_joy/data/recomendation/source/recomendation_data.dart';
import 'package:top_joy/data/service_data/repository/service_data_impl.dart';
import 'package:top_joy/data/service_data/source/service_data.dart';
import 'package:top_joy/data/services/location_service.dart';
import 'package:top_joy/domain/auth/repository/auth_repository.dart';
import 'package:top_joy/domain/auth/repository/verify_code_repository.dart';
import 'package:top_joy/domain/auth/usecsae/send_auth_usecase.dart';
import 'package:top_joy/domain/auth/usecsae/verify_code_usecase.dart';
import 'package:top_joy/domain/banner/repository/banner_repository.dart';
import 'package:top_joy/domain/banner/usecase/get_banners.dart';
import 'package:top_joy/domain/dioClient/repositories/dio_client_repository.dart';
import 'package:top_joy/domain/recomendation/repository/recomendation_repository.dart';
import 'package:top_joy/domain/recomendation/usecase/get_recomendation_usecase.dart';
import 'package:top_joy/domain/service_data/reporitory/service_data_repository.dart';
import 'package:top_joy/domain/service_data/usecase/get_service_data.dart';
import 'package:top_joy/presentation/auth/bloc/verify_code_bloc/verify_bloc.dart';
import 'presentation/auth/bloc/auth_bloc/auth_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  final dio = Dio();
  getIt.registerSingleton<Dio>(dio);

  // SharedPreferences ro'yxatga olish (birinchi bo'lib ro'yxatga olamiz)
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Connectivity
  getIt.registerSingleton<Connectivity>(Connectivity());

  // Location
  getIt.registerLazySingleton<LocationService>(
      () => LocationServiceImpl(getIt<SharedPreferences>()));

  // DioClient
  getIt.registerSingleton<DioClient>(DioClient(dio));
  getIt.registerSingleton<DioClientRepository>(
    DioClientRepositoryImpl(getIt<DioClient>()),
  );

  // VerifyCode ro'yxatga olish
  getIt.registerLazySingleton<VerifyCodeUsecase>(
      () => VerifyCodeUsecase(getIt()));
  getIt.registerLazySingleton<VerifyCodeRepository>(
      () => VerifyCodeRepositoryImpl(getIt()));
  getIt.registerLazySingleton<VerifyCodeSource>(
      () => VerifyCodeSourceImpl(getIt()));
  getIt.registerLazySingleton<VerifyBloc>(() => VerifyBloc(getIt()));

  // Auth ro'yxatga olish
  getIt.registerFactory(() => AuthBloc(getIt()));
  getIt.registerLazySingleton(() => SendOTPUseCase(getIt()));
  getIt
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      getIt<DioClientRepository>(),
      getIt<Connectivity>(),
    ),
  );

  // Banner ro'yxatga olish
  getIt.registerSingleton<BannerService>(BannerServiceImpl(
    getIt<DioClientRepository>(),
    getIt<Connectivity>(),
  ));
  getIt.registerSingleton<BannerRepository>(
      BannerRepositoryImpl(getIt<BannerService>()));
  getIt.registerSingleton<GetBannersUsecase>(
      GetBannersUsecase(getIt<BannerRepository>()));

  // Service data ro'yxatga olish
  getIt.registerLazySingleton<ServiceData>(
    () => ServiceDataImpl(
      dioClientRepository: getIt<DioClientRepository>(),
      locationService: getIt<LocationService>(),
      connectivity: getIt<Connectivity>(),
    ),
  );
  getIt.registerSingleton<ServiceDataRepository>(
      ServiceDataRepositoryImpl(getIt<ServiceData>()));
  getIt.registerSingleton<GetServiceDataUsercase>(
      GetServiceDataUsercase(getIt<ServiceDataRepository>()));

  // Recomendation ro'yxatga olish
  getIt.registerSingleton<RecomendationData>(RecomendationDataImpl(
      dioClientRepository: getIt<DioClientRepository>(),
      connectivity: getIt<Connectivity>(),
      locationService: getIt<LocationService>()));
  getIt.registerSingleton<RecomendationRepository>(
      RecomendationRepositoryImpl(getIt<RecomendationData>()));
  getIt.registerSingleton<GetRecomendationUsecase>(
      GetRecomendationUsecase(getIt<RecomendationRepository>()));
}
