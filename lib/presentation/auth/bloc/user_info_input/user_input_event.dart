part of 'user_input_bloc.dart';

abstract class UserInputEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserPostEvent extends UserInputEvent {
  final UserPost userModel;

  UserPostEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UserPutEvent extends UserInputEvent {
  final UserPost userModel;

  UserPutEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}
