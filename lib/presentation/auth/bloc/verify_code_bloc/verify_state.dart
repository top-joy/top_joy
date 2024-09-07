part of 'verify_bloc.dart';

abstract class VerifyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyFailure extends VerifyState {
  final String error;

  VerifyFailure(this.error);

  @override
  List<Object?> get props => [error];
}
