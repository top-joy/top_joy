import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/auth/entity/auth_requests.dart';
import '../../../../domain/auth/usecsae/send_auth_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOTPUseCase sendOTPUseCase;

  AuthBloc(this.sendOTPUseCase) : super(AuthInitial()) {
    on<SendOTPEvent>(_onSendOTP);
  }

  Future<void> _onSendOTP(SendOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await sendOTPUseCase(AuthRequest(event.phoneNumber));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
