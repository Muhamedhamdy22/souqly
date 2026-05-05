import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/core/cache_helper/cache_helper.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/profile/data/datasource/profile_ds.dart';

@Injectable(as: ProfileDs)
class ProfileDsImpl implements ProfileDs {
  ApiManager apiManager;
  CacheHelper cacheHelper;

  ProfileDsImpl(this.apiManager, this.cacheHelper);

  Options get _authOptions => Options(
    headers: {"Authorization": "Bearer ${cacheHelper.getString("token")}"},
  );

  @override
  Future<User> getProfile() async {
    try {
      var response = await apiManager.get(
        endpoint: EndPoint.me,
        options: _authOptions,
      );
      return User.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await apiManager.post(
        endpoint: EndPoint.logout,
        options: _authOptions,
      );
      await cacheHelper.remove("token");
      return true;
    } catch (e) {
      rethrow;
    }
  }
}