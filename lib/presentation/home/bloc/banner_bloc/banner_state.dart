import 'package:top_joy/data/banner/models/banner_model.dart';

abstract class BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final BannerModel banners;
  final int currentIndex;

  BannerLoaded({required this.banners, this.currentIndex = 0});
}

class LoadBannersFailure extends BannerState {}
