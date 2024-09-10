part of 'verify_bloc.dart';

abstract class VerifyEvent extends Equatable {
  const VerifyEvent();

  @override
  List<Object?> get props => [];
}

class VerifyCodeEvent extends VerifyEvent {
  final String phoneNumber;
  final String code;

  const VerifyCodeEvent({required this.phoneNumber, required this.code});

  @override
  List<Object?> get props => [phoneNumber, code];
}

class CheckUserEvent extends VerifyEvent {
  final String phoneNumber;

  const CheckUserEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}
