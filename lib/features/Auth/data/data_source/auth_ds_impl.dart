import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/features/Auth/data/data_source/auth_ds.dart';
import 'package:souqly/features/Auth/data/models/AuthResponse.dart';
import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';
@Injectable(as: AuthDs)
class AuthDsImpl implements AuthDs{
  ApiManager apiManager;
  AuthDsImpl(this.apiManager);
  @override
  Future<AuthResponse> login(String email, String password) async{
   try{
    var response=await apiManager.post(endpoint: EndPoint.login, data: {
       "email": email
        ,"password": password
     });
      return AuthResponse.fromJson(response.data);
   }catch(e){
      rethrow;
   }
  }

  @override
  Future<AuthResponse> register(SignUpRequest request) async{
    try{
     var response=await apiManager.post(endpoint: EndPoint.register ,
          data: request.toJson()
      );
      return AuthResponse.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}