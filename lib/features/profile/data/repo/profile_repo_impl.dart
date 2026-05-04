import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/profile/data/datasource/profile_ds.dart';
import 'package:souqly/features/profile/domain/repo/repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileDs profileDs;

  ProfileRepoImpl(this.profileDs);

  @override
  Future<User> getProfile() async {
    try {
      return await profileDs.getProfile();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await profileDs.logout();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}