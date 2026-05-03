import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';

abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
   String email;
   String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthEvents {
  SignUpRequest request;
  RegisterEvent(this.request);
}