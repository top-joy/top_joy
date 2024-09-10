import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/domain/auth/entity/check_user.dart';
import 'package:top_joy/domain/auth/usecsae/verify_code_usecase.dart';
import 'package:top_joy/injection.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  VerifyCodeUsecase verifyCodeUsecase;
  UserProfileBloc(this.verifyCodeUsecase) : super(UserProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<LogOutEvent>(_onLogOutEvent);
    on<FetchUser>(_onFetchUser);
  }

  Future<void> _onLoadUserProfile(
      LoadUserProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());

    try {
      var userBox = getIt<Box<UserModel>>();
      UserModel? userModel = userBox.get('user');

      if (userModel != null) {
        emit(UserProfileLoaded(userModel: userModel));
      } else {
        emit(UserProfileError(message: "User not found"));
      }
    } catch (error) {
      emit(UserProfileError(message: error.toString()));
    }
  }

  Future<void> _onLogOutEvent(
      LogOutEvent event, Emitter<UserProfileState> emit) async {
    final sharedPreferences = getIt<SharedPreferences>();
    await sharedPreferences.setBool('isRegistor', false);
  }

  Future<void> _onFetchUser(
      FetchUser event, Emitter<UserProfileState> emit) async {
    final perfs = getIt<SharedPreferences>();
    String phoneNumber = perfs.getString('phoneNumber') ?? "";

    verifyCodeUsecase.checkUser(CheckUser(phoneNumber.substring(1)));
  }
}
