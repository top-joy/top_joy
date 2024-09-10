part of 'recomendation_bloc.dart';

abstract class RecomendationEvent extends Equatable {
  const RecomendationEvent();

  @override
  List<Object> get props => [];
}

class FetchRecomendationData extends RecomendationEvent {}
