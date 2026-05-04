import 'package:souqly/features/Auth/data/models/AuthResponse.dart';

abstract class ProfileRepo {
  Future<User> getProfile();
  Future<bool> logout();
}