import 'package:dartz/dartz.dart';
import 'package:top_joy/core/usecase/usecase.dart';
import 'package:top_joy/domain/banner/repository/banner_repository.dart';

class GetBannersUsecase implements UseCase<Either, dynamic> {
  final BannerRepository repository;

  GetBannersUsecase(this.repository);
  @override
  Future<Either> call({dynamic params}) async {
    return await repository.getBanner();
  }
}
