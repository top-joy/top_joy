import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/auth/entity/check_user.dart';
import 'package:top_joy/domain/auth/entity/verify_code.dart';
import 'package:top_joy/domain/auth/usecsae/verify_code_usecase.dart';

part 'verify_state.dart';
part 'verify_event.dart';

class VerifyBloc extends Bloc<VerifyEvent, CombinedState> {
  final VerifyCodeUsecase _verifyCodeUsecase;

  VerifyBloc(this._verifyCodeUsecase)
      : super(CombinedState(VerifyInitial(), CheckUserInitial())) {
    on<VerifyCodeEvent>(_onVerifyCodeEvent);
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  Future<void> _onVerifyCodeEvent(
      VerifyCodeEvent event, Emitter<CombinedState> emit) async {
    emit(CombinedState(VerifyLoading(), state.userState));
    try {
      await _verifyCodeUsecase.call(
        VerifyCode(event.phoneNumber, event.code),
      );
      emit(CombinedState(VerifySuccess(), state.userState));
    } catch (error) {
      emit(CombinedState(VerifyFailure(error.toString()), state.userState));
    }
  }

  Future<void> _onCheckUserEvent(
      CheckUserEvent event, Emitter<CombinedState> emit) async {
    emit(CombinedState(state.verifyState, VerifyLoading()));
    try {
      await _verifyCodeUsecase.checkUser(
        CheckUser(event.phoneNumber),
      );
      emit(CombinedState(state.verifyState, CheckUserSuccess()));
    } catch (error) {
      emit(
          CombinedState(state.verifyState, CheckUserFailure(error.toString())));
    }
  }
}
