import 'package:injectable/injectable.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';
import 'package:souqly/features/Auth/domain/repo/auth_repo.dart';
@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
 Future<AuthResponse> call(SignUpRequest request) {
    return authRepo.register(request);
  }
}