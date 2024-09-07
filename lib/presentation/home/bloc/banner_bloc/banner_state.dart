import 'package:equatable/equatable.dart';
import 'package:top_joy/data/banner/models/banner_model.dart';

abstract class BannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final BannerModel banners;
  final int currentIndex;

  BannerLoaded({required this.banners, this.currentIndex = 0});
}

class LoadBannersFailure extends BannerState {
  final String error;
  LoadBannersFailure(this.error);

  @override
  List<Object?> get props => [error];
}
