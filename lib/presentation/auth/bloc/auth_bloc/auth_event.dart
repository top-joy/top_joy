import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendOTPEvent extends AuthEvent {
  final String phoneNumber;

  SendOTPEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}
