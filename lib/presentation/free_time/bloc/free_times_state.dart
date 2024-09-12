part of 'free_times_cubit.dart';

abstract class FreeTimesState extends Equatable {
  const FreeTimesState();

  @override
  List<Object> get props => [];
}

class FreeTimesInitial extends FreeTimesState {}

class FreeTimesLoading extends FreeTimesState {}

class FreeTimesLoaded extends FreeTimesState {
  final List<FreeTime> freeTimes;

  const FreeTimesLoaded(this.freeTimes);

  @override
  List<Object> get props => [freeTimes];
}

class FreeTimesError extends FreeTimesState {
  final String message;

  const FreeTimesError(this.message);

  @override
  List<Object> get props => [message];
}
