import 'package:injectable/injectable.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/profile/domain/repo/repo.dart';

@injectable
class ProfileUseCase {
  ProfileRepo profileRepo;

  ProfileUseCase(this.profileRepo);

  Future<User> getProfile() => profileRepo.getProfile();
  Future<bool> logout() => profileRepo.logout();
}