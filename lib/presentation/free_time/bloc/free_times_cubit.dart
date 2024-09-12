import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:top_joy/data/free_time/models/free_time_model.dart';
import 'package:top_joy/domain/free_time/usecase/fetch_free_times_usecase.dart';

part 'free_times_state.dart';

class FreeTimesCubit extends Cubit<FreeTimesState> {
  final FetchFreeTimesUseCase fetchFreeTimesUseCase;

  FreeTimesCubit(this.fetchFreeTimesUseCase) : super(FreeTimesInitial());

  Future<void> fetchFreeTimes(String serviceId, DateTime date) async {
    emit(FreeTimesLoading());
    final result = await fetchFreeTimesUseCase(serviceId, date);

    result.fold(
      (error) => emit(FreeTimesError(error)),
      (freeTimes) => emit(FreeTimesLoaded(freeTimes)),
    );
  }
}
