import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/auth/entity/verify_code.dart';

import '../../../../domain/auth/usecsae/verify_code_usecase.dart';

part 'verify_state.dart';
part 'verify_event.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  VerifyCodeUsecase verifyCodeUsecase;

  VerifyBloc(this.verifyCodeUsecase) : super(VerifyInitial()) {
    on<VerifyCodeEvent>(_onVerifyCodeEvent);
  }

  Future<void> _onVerifyCodeEvent(
      VerifyCodeEvent event, Emitter<VerifyState> emit) async {
    emit(VerifyLoading());
    try {
      await verifyCodeUsecase(VerifyCode(event.phoneNumber, event.code));
      emit(VerifySuccess());
    } catch (e) {
      print(e);
      emit(VerifyFailure(e.toString()));
    }
  }
}
