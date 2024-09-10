part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUserProfile extends UserProfileEvent {}

class FetchUser extends UserProfileEvent {}

class LogOutEvent extends UserProfileEvent {}
