import 'package:injectable/injectable.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/Auth/domain/repo/auth_repo.dart';
@injectable
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);

 Future<AuthResponse> call(String email, String password) => authRepo.login(email, password);
}
