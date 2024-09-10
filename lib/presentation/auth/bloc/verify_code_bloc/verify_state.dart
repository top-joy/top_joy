part of 'verify_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class VerifyInitial extends BaseState {}

class VerifyLoading extends BaseState {}

class VerifySuccess extends BaseState {}

class VerifyFailure extends BaseState {
  final String error;

  const VerifyFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class CheckUserInitial extends BaseState {}

class CheckUserSuccess extends BaseState {}

class CheckUserFailure extends BaseState {
  final String error;

  const CheckUserFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class CombinedState extends Equatable {
  final BaseState verifyState;
  final BaseState userState;

  const CombinedState(this.verifyState, this.userState);

  @override
  List<Object?> get props => [verifyState, userState];
}
