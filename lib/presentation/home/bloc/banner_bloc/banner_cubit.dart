import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/banner/usecase/get_banners.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/home/bloc/banner_bloc/banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerLoading());

  void getBanners() async {
    var returnData = await getIt<GetBannersUsecase>().call();

    returnData.fold(
      (error) {
        if (!isClosed) {
          String errorMessage = error.message ?? 'An unknown error occurred';
          emit(LoadBannersFailure(errorMessage));
        }
      },
      (data) {
        if (!isClosed) {
          emit(BannerLoaded(banners: data));
        }
      },
    );
  }

  void updateIndex(int index) {
    if (state is BannerLoaded && !isClosed) {
      final currentState = state as BannerLoaded;
      emit(BannerLoaded(banners: currentState.banners, currentIndex: index));
    }
  }
}
