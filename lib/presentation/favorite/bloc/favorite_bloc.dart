import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/error/failure.dart';
import '../../../data/favorite/model/favorite_request_model.dart';
import '../../../data/favorite/source/favorite_source.dart';
import '../../../data/service_data/models/service_models.dart';
import '../../../domain/favorite/entity/favorite_entity.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteSource favoriteSource;

  FavoriteBloc(this.favoriteSource) : super(FavoriteInitial()) {
    on<AddFavoriteEvent>(_onAddFavorite);
    on<DeleteFavoriteEvent>(_onDeleteFavorite);
    on<GetFavoritesEvent>(_onGetFavorites);
  }

  Future<void> _onAddFavorite(
      AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    await _handleFavoriteAction(
      () => favoriteSource.addFavorite(event.favorite),
      emit,
      successMessage: 'Favorite added successfully!',
    );
  }

  Future<void> _onDeleteFavorite(
      DeleteFavoriteEvent event, Emitter<FavoriteState> emit) async {
    await _handleFavoriteAction(
      () => favoriteSource.deleteFavorite(event.favorite),
      emit,
      successMessage: 'Favorite deleted successfully!',
    );
  }

  Future<void> _onGetFavorites(
      GetFavoritesEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final Either<Failure, List<ServiceModels>> result =
        await favoriteSource.getFavorites(event.userId);

    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (favorites) => emit(FavoriteLoaded(favorites)),
    );
  }

  Future<void> _handleFavoriteAction(
    Future<Either<Failure, void>> Function() favoriteAction,
    Emitter<FavoriteState> emit, {
    required String successMessage,
  }) async {
    emit(FavoriteLoading());
    final result = await favoriteAction();
    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (_) => emit(FavoriteActionSuccess(successMessage)),
    );
  }
}
