part of 'verify_bloc.dart';

abstract class VerifyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyCodeEvent extends VerifyEvent {
  final String phoneNumber;
  final String code;
  VerifyCodeEvent(this.phoneNumber, this.code);

  @override
  List<Object?> get props => [phoneNumber, code];
}
