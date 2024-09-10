part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserModel userModel;

  UserProfileLoaded({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class UserProfileError extends UserProfileState {
  final String message;

  UserProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
