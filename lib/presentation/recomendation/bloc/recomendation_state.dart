part of 'recomendation_bloc.dart';

abstract class RecomendationState extends Equatable {
  const RecomendationState();

  @override
  List<Object> get props => [];
}

class RecomendationInitial extends RecomendationState {}

class LoadingRecomendation extends RecomendationState {}

class LoadedRecomendation extends RecomendationState {
  final List<ServiceModels> recomendationData;
  const LoadedRecomendation(this.recomendationData);

  @override
  List<Object> get props => [recomendationData];
}

class ErrorRecomendation extends RecomendationState {
  final String error;
  const ErrorRecomendation(this.error);

  @override
  List<Object> get props => [error];
}
