part of 'user_input_bloc.dart';

abstract class UserInputState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserPostInitial extends UserInputState {}

class UserPostLoading extends UserInputState {}

class UserPostSuccess extends UserInputState {}

class UserPostFailure extends UserInputState {
  final String error;

  UserPostFailure(this.error);

  @override
  List<Object?> get props => [error];
}
