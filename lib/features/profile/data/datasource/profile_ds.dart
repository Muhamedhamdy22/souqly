import 'package:souqly/features/Auth/data/models/AuthResponse.dart';

abstract class ProfileDs {
  Future<User> getProfile();
  Future<bool> logout();
}