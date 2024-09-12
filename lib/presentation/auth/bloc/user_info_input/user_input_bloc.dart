import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/user/entity/user_post.dart';
import '../../../../domain/user/usecase/post_user_usecase.dart';

part 'user_input_event.dart';
part 'user_input_state.dart';

class UserInputBloc extends Bloc<UserInputEvent, UserInputState> {
  final PostUserUsecase postUserUsecase;
  final PutUserUsecase putUserUsecase;

  UserInputBloc(this.postUserUsecase, this.putUserUsecase)
      : super(UserPostInitial()) {
    on<UserPostEvent>(_onUserPostEvent);
    on<UserPutEvent>(_onUserPutEvent);
  }

  Future<void> _onUserPostEvent(
      UserPostEvent event, Emitter<UserInputState> emit) async {
    emit(UserPostLoading());

    try {
      final user = event.userModel;
      await postUserUsecase(UserPost(
        birthday: user.birthday,
        firstName: user.firstName,
        gender: user.gender,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        photo: user.photo,
      ));
      emit(UserPostSuccess());
    } catch (e) {
      emit(UserPostFailure(e.toString()));
    }
  }

  Future<void> _onUserPutEvent(
      UserPutEvent event, Emitter<UserInputState> emit) async {
    emit(UserPostLoading());
    try {
      final user = event.userModel;
      await putUserUsecase(UserPost(
          birthday: user.birthday,
          firstName: user.firstName,
          gender: user.gender,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          photo: user.photo));
      emit(UserPostSuccess());
    } catch (e) {
      emit(UserPostFailure(e.toString()));
    }
  }
}
