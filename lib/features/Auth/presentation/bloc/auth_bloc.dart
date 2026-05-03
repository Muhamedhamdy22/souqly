import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/domain/usecase/login_use_case.dart';
import 'package:souqly/features/Auth/domain/usecase/register_use_case.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_events.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvents , AuthState>{
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  AuthBloc(this.loginUseCase , this.registerUseCase) : super(AuthState()){
    on<LoginEvent>(_login);
    on<RegisterEvent>(_signup);
  }

  _login(LoginEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(
        LoginRequestStatus: RequestStatus.loading
    ));
    try{
      var response= await loginUseCase.call(event.email, event.password);
      emit(state.copyWith(
          LoginRequestStatus: RequestStatus.success,
          LoginResponse: response
      ));
    }on BaseException catch(e){
      emit(state.copyWith(
          LoginRequestStatus: RequestStatus.error,
          LoginRequestMessage: e.message
      ));
    }
    catch(e){
      emit(state.copyWith(
          LoginRequestStatus: RequestStatus.error,
          LoginRequestMessage: e.toString()
      ));
    }
  }
  _signup(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(
        LoginRequestStatus: RequestStatus.loading
    ));
    try{
      var response= await registerUseCase.call(event.request);
      emit(state.copyWith(
          SingUpRequestStatus: RequestStatus.success,
          SingUpResponse: response
      ));
    } catch(e){
      emit(state.copyWith(
          SingUpRequestStatus: RequestStatus.error,
          SingUpRequestMessage: e.toString()
      ));
    }
  }
}