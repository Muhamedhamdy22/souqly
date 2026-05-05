import 'package:souqly/features/Auth/data/models/AuthResponse.dart';

enum ProfileStatus { init, loading, success, error }

class ProfileState {
  ProfileStatus getProfileStatus;
  ProfileStatus logoutStatus;
  User? user;
  String? errorMessage;

  ProfileState({
    this.getProfileStatus = ProfileStatus.init,
    this.logoutStatus = ProfileStatus.init,
    this.user,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? getProfileStatus,
    ProfileStatus? logoutStatus,
    User? user,
    String? errorMessage,
  }) {
    return ProfileState(
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}