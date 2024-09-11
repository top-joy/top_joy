part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class AddFavoriteEvent extends FavoriteEvent {
  final FavoriteRequestModel favorite;

  const AddFavoriteEvent(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class DeleteFavoriteEvent extends FavoriteEvent {
  final FavoriteEntity favorite;

  const DeleteFavoriteEvent(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class GetFavoritesEvent extends FavoriteEvent {
  final String userId;

  const GetFavoritesEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
