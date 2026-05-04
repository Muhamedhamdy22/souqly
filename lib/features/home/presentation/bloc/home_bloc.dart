import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/domain/usecase/home_use_case.dart';
import 'package:souqly/features/home/presentation/bloc/home_events.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';
@injectable
class HomeBloc extends Bloc<HomeEvents , HomeState>{
  HomeUseCase homeUseCase;
  HomeBloc(this.homeUseCase) : super(HomeState()) {
    on<GetCategories>(_getCategories);
  }

  _getCategories(GetCategories event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.loading));
      var response = await homeUseCase();
      emit(state.copyWith(
          getCategoriesRequestStatus: RequestStatus.success, model: response));
    } on BaseException catch (e) {
      emit(state.copyWith(
          getCategoriesRequestStatus: RequestStatus.error,
          errorMessage: e.message
      ));
    } catch (e) {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.error));
    }
  }
}