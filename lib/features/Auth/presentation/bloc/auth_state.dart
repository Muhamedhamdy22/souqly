import 'package:souqly/features/Auth/data/models/AuthResponse.dart';

enum RequestStatus { init,loading, success, error }
class AuthState {

  RequestStatus? LoginRequestStatus;
  String? LoginRequestMessage;
  AuthResponse ? LoginResponse;
  RequestStatus? SingUpRequestStatus;
  String? SingUpRequestMessage;
  AuthResponse ? SingUpResponse;

  AuthState({
    this.LoginRequestStatus=RequestStatus.init,
    this.LoginRequestMessage,
    this.LoginResponse,
    this.SingUpRequestStatus=RequestStatus.init,
    this.SingUpRequestMessage,
    this.SingUpResponse
  });

  AuthState copyWith({
    RequestStatus? LoginRequestStatus,
    String? LoginRequestMessage,
    AuthResponse ? LoginResponse,
    RequestStatus? SingUpRequestStatus,
    String? SingUpRequestMessage,
    AuthResponse ? SingUpResponse
  }) {
    return AuthState(
        LoginRequestStatus: LoginRequestStatus ?? this.LoginRequestStatus,
        LoginRequestMessage: LoginRequestMessage ?? this.LoginRequestMessage,
        LoginResponse: LoginResponse ?? this.LoginResponse,
        SingUpRequestStatus: SingUpRequestStatus ?? this.SingUpRequestStatus,
        SingUpRequestMessage: SingUpRequestMessage ?? this.SingUpRequestMessage,
        SingUpResponse: SingUpResponse ?? this.SingUpResponse
    );
  }
}