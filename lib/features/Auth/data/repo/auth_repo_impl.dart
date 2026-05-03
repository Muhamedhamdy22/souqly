import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/data/data_source/auth_ds.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';
import 'package:souqly/features/Auth/domain/repo/auth_repo.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  AuthDs authDs;
  AuthRepoImpl(this.authDs);
  @override
  Future<AuthResponse> login(String email, String password) async{
   try{
    var response=await authDs.login(email, password);
    return response;
   }catch (e){
     throw AuthFailedException("UserName or Password is incorrect");
   }
  }

  @override
  Future<AuthResponse> register(SignUpRequest request) async{
    try{
     var response=await authDs.register(request);
      return response;
    }catch(e){
      throw AuthFailedException("Failed to register");
    }
  }
}