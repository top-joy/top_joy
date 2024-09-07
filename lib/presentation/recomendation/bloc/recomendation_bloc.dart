import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/domain/recomendation/usecase/get_recomendation_usecase.dart';
part 'recomendation_event.dart';
part 'recomendation_state.dart';

class RecomendationBloc extends Bloc<RecomendationEvent, RecomendationState> {
  final GetRecomendationUsecase _getRecomendationUsecase;

  RecomendationBloc({required GetRecomendationUsecase getRecomendationUsecase})
      : _getRecomendationUsecase = getRecomendationUsecase,
        super(RecomendationInitial()) {
    on<FetchRecomendationData>(_onFetchRecomendationData);
  }

  Future<void> _onFetchRecomendationData(
      FetchRecomendationData event, Emitter<RecomendationState> emit) async {
    emit(LoadingRecomendation());
    final result = await _getRecomendationUsecase.call();

    result.fold(
      (error) => emit(ErrorRecomendation(error.message)),
      (data) => emit(LoadedRecomendation(data)),
    );
  }
}
