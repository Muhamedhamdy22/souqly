import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/categories/data/models/CategoryResponse.dart';

class CategoryState {
  RequestStatus? getCategoriesRequestStatus;
  CategoryResponse ? model;
  String? errorMessage;
  CategoryState({
    this.getCategoriesRequestStatus=RequestStatus.init,
    this.errorMessage,
    this.model,
  });
  CategoryState copyWith({
    RequestStatus? getCategoriesRequestStatus,
    CategoryResponse ? model,
    String? errorMessage,
    int? selectedIndex,
    RequestStatus? getSupCategoriesRequestStatus,
  }) {
    return CategoryState(
      getCategoriesRequestStatus: getCategoriesRequestStatus ?? this.getCategoriesRequestStatus,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}