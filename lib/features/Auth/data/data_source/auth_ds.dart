import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';

abstract class AuthDs {
 Future<AuthResponse> login(String email, String password);
 Future<AuthResponse> register(SignUpRequest request);

}