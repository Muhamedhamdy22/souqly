import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/categories/domain/usecase/category_use_case.dart';
import 'package:souqly/features/categories/presentation/bloc/category_events.dart';
import 'package:souqly/features/categories/presentation/bloc/category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  CategoryUseCase getCategoriesUsecase;

  CategoryBloc(this.getCategoriesUsecase)
      : super(CategoryState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<ChangeSelectedCategoryIndexEvent>(_changeSelectedCategoryIndex);
  }

  _changeSelectedCategoryIndex(
      ChangeSelectedCategoryIndexEvent event, Emitter<CategoryState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
  _getCategories(GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.loading));
      var response = await getCategoriesUsecase();
      emit(state.copyWith(
          getCategoriesRequestStatus: RequestStatus.success, model: response));
    } on BaseException catch (e) {
      emit(state.copyWith(
          getCategoriesRequestStatus: RequestStatus.error,
          errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.error));
    }
  }
}