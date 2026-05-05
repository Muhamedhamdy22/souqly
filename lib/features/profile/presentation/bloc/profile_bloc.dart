import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/profile/domain/usecase/profile_usecase.dart';
import 'package:souqly/features/profile/presentation/bloc/profile_event.dart';
import 'package:souqly/features/profile/presentation/bloc/profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileUseCase profileUseCase;

  ProfileBloc(this.profileUseCase) : super(ProfileState()) {
    on<GetProfile>(_getProfile);
    on<LogoutEvent>(_logout);
  }

  _getProfile(GetProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(getProfileStatus: ProfileStatus.loading));
      var user = await profileUseCase.getProfile();
      emit(state.copyWith(
        getProfileStatus: ProfileStatus.success,
        user: user,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        getProfileStatus: ProfileStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(getProfileStatus: ProfileStatus.error));
    }
  }

  _logout(LogoutEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(logoutStatus: ProfileStatus.loading));
      await profileUseCase.logout();
      emit(state.copyWith(logoutStatus: ProfileStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(
        logoutStatus: ProfileStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(logoutStatus: ProfileStatus.error));
    }
  }
}