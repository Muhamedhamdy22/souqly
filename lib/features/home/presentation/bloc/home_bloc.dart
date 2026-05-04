import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/domain/usecase/home_use_case.dart';
import 'package:souqly/features/home/presentation/bloc/home_events.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeUseCase homeUseCase;
  HomeBloc(this.homeUseCase) : super(HomeState()) {
    on<GetCategories>(_getCategories);
    on<GetProducts>(_getProducts);
  }

  _getCategories(GetCategories event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.loading));
      var response = await homeUseCase.getCategories();
      emit(state.copyWith(
        getCategoriesRequestStatus: RequestStatus.success,
        categoriesModel: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        getCategoriesRequestStatus: RequestStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.error));
    }
  }

  _getProducts(GetProducts event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(getProductsRequestStatus: RequestStatus.loading));
      var response = await homeUseCase.getProducts();
      emit(state.copyWith(
        getProductsRequestStatus: RequestStatus.success,
        productsModel: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        getProductsRequestStatus: RequestStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(getProductsRequestStatus: RequestStatus.error));
    }
  }
}